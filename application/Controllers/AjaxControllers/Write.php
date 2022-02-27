<?php 

declare(strict_types = 1); 

class Write extends ProtectedController {
    private $writeModel;

    use WriteTraits;
    
    public function __grandchildConstruct(){
        $this->writeModel = $this->model('WriteModel');
    }
    
    public function index(){}
    
    /**
     * Upload Images for article
     * 
     * @route true
     */
    public function uploadImage() {
        $data = [
            'status' => 500,
            'url' => ""
        ];

        // refer to write model for iamge validation
        $img = $_FILES['image'] ?? $_POST['src'] ?? false;

        if($img) {
            $url = $this->writeModel->uploadImage($img);

            if($url) {
                $data['status'] = 200;
                $data['url'] = $url;
            }
        }

        echo json_encode($data);
    }

    /**
     * Validate form contents
     * Save in database
     * 
     * @route true
     * @postParams
     */
    public function submitForm() {
        /* Prevent duplicate submissions */
        if (isset($_COOKIE['FormSubmitted'])) {
            $data['message'] = 'You may only submit this form once within 24 Hrs!';
            echo json_encode($data); exit;
        }

        try {            
            $post = $_POST;
            $hasErors = $this->validateData($post);
            if($hasErors) {
                echo json_encode($hasErors); exit;
            }

            extract($post);            
            $ipAddress = $this->getIPAddress();
            $hashKey = $this->generateHashKey($receipt_id);

            $formData = [
                'amount' => (int) $amount,
                'buyer' => ht($buyer),
                'receipt_id' => ht($receipt_id),
                'items' => ht($items),
                'buyer_email' => ht($buyer_email),
                'note' => ht($note),
                'city' => ht($city),
                'phone' => (int) $phone,

                'buyer_ip' => $ipAddress,                
                'hash_key' => $hashKey,
                'entry_by' => $_SESSION['user_id'],
            ];

            $data = [];

            if(Str::emptyStrings($data)) {
                // Upload Article
                $formId = $this->writeModel->createForm($formData);                
                if($formId) {
                    $data['status'] = 200;
                    $data['form_id'] = $formId;

                    /* Set a cookie to prevent duplicate submissions for 24 hours */
                    setcookie('FormSubmitted', '1', time() + 86400 * 1);
                    echo json_encode($data); exit;
                }
            }
        }catch(\Exception $e) {
            $data['status'] = 500;
            $data['message'] = $e->getMessage();
            echo json_encode($data);
        }        
    }

    private function validateData($inputData) {
        extract($inputData);

         //Sanitize input data using PHP filter_var().
        $amount = filter_var($amount, FILTER_SANITIZE_NUMBER_INT);
        $buyer = filter_var($buyer, FILTER_SANITIZE_STRING);
        $receipt_id = filter_var($receipt_id, FILTER_SANITIZE_STRING);
        $items = filter_var($items, FILTER_SANITIZE_STRING);
        $buyer_email = filter_var($buyer_email, FILTER_SANITIZE_EMAIL);
        $note = filter_var($note, FILTER_SANITIZE_STRING);
        $city = filter_var($city, FILTER_SANITIZE_STRING);
        $phone = filter_var($phone, FILTER_SANITIZE_NUMBER_INT);

        //additional php validation
        $errors = [];

        (!$amount) ? $errors['amount'] = 'Amount must be Number' : '';
        (strlen($buyer) > 20) ? $errors['buyer'] = 'Buyer exceeds 20 characters' : '';
        (strlen($receipt_id) > 20) ? $errors['receipt_id'] = 'Receipt ID exceeds 20 characters' : '';
        (!filter_var($buyer_email, FILTER_VALIDATE_EMAIL)) ? $errors['buyer_email'] = 'Please enter a valid email!' : '';
        (strlen($note) > 30) ? $errors['note'] = 'Note exceeds 30 characters' : '';
        (strlen($city) > 20) ? $errors['city'] = 'City exceeds 20 characters' : '';
        (!$phone) ? $errors['phone'] = 'Phone must be Number' : '';

        return $errors;
    }

    private function generateHashKey($data, $algo = 'sha512', $salt = 'xpeed') {
        return hash($algo, $salt.$data, false);
    }

    /**
     * Check title, tagline, content, iframes, images for errors
     * Content is html purified before call
     * 
     * @param array $errors
     * @param array $draft - Content Values
     * 
     * @return array $errors - List of errors
     */
    private function checkArticleErrors(array $errors, array $draft): array {
        // HTML Purified before calling function
        extract($draft);

        if(Str::trimWhiteSpaces($title) === "")
            $errors['title_err'] = "Please add title";
        else if(mb_strlen($title) > $this->articleLimits["title"]) 
            $errors['title_err'] = "Title must be less than {$this->articleLimits["title"]} characters";
        

        if(mb_strlen($tagline) > $this->articleLimits["tagline"]) 
            $errors['tagline_err'] = "Tagline must be less than {$this->articleLimits["tagline"]} characters";
        

        if(mb_strlen($content) > $this->articleLimits["content"]) 
            $errors['content_err'] = "Content length exceeds {$this->articleLimits["content"]} characters";

        return $errors;
    }

}