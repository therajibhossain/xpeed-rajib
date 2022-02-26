<?php 

declare(strict_types = 1); 

class Home extends ProtectedController {
    public function __grandchildConstruct() {
        $this->exploreModel = $this->model("ExploreModel");
    }

    use HomeTraits;

    /**
     * Home Page 
     * Fetch Forms
     * @route
     */
    public function index(): void {
        // Fetch submitted forms
        $data = [];
        $data['forms'] = $this->exploreModel->homeForms($_SESSION['user_id'], $this->maxForms);
        $this->view('home/index', $data);
    }
}