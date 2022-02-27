<?php
    View::header(false, "Write");
    View::customNav([]); 
    // require_once APPROOT.'/Views/inc/user/write-includes.php';
?>

<main>
    <div style='margin-bottom: 100px'></div>
    <div class="container-lg px-lg-2">
        <div class="row">
            <h4 class='d-block'>Submit a new Form</h4>
            <div class="pb-md-1 pb-3"></div>

            <form id="submit-form">
                <div class="col-md-8 col-12 order-md-1 order-2 ps-md-3 pe-md-0 py-4 p-0">
                    <div class="p-md-4 bg-white rounded p-2 py-4" style='border: 1px solid #d7d7d7'>
                        <div class="alert alert-danger display-error" style="display: none"></div>

                        <label for="amount">Amount <span>(required)</span></label>
                        <input type="number" class='form-control bg-white' placeholder="Amount" id='amount' required><br>

                        <label for="buyer">Buyer <span>(required, max 20 characters)</span></label>
                        <input type="text" class='form-control bg-white' placeholder="Buyer" id='buyer' required maxlength="20"><br>

                        <label for="receipt_id">Receipt ID <span>(required, max 20 characters)</span></label>
                        <input type="text" class='form-control bg-white' placeholder="Reciept ID" id='receipt_id' required maxlength="20"><br>

                        <label for="items">Items <span>(required, max 255 characters)</span></label>
                        <input type="text" class='form-control bg-white' placeholder="Items" id='items' required maxlength="255"><br>

                        <label for="buyer_email">Buyer Email <span>(required, max 20 characters)</span></label>
                        <input type="email" class='form-control bg-white' placeholder="Buyer Email" id='buyer_email' required maxlength="50"><br>

                        <label for="note">Note <span>(max 30 characters)</span></label>
                        <input type="text" class='form-control bg-white' placeholder="Note" id='note' maxlength="30"><br>

                        <label for="city">City <span>(required, max 20 characters)</span></label>
                        <input type="text" class='form-control bg-white' placeholder="City" id='city' required maxlength="20"><br>

                        <label for="phone">Phone <span>(required, [min: 11, max: 13 with 88] characters)</span></label>
                        <input type="number" class='form-control bg-white' placeholder="Phone" id='phone' required minlength="11" maxlength="13"><br>

                        <button class="btn btn-success px-3 float-end d-block mt-1" id="submit-post">Submit</button>
                        <div style='margin-bottom: 40px'></div>
                    </div>

                    <div class="error-div"></div>
                </div>
            </form>

        </div>
    </div>

</main>
<?=View::formToken(IMG_VALIDATE_URL, "img_valid_url")?>

<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js" integrity="sha512-894YE6QWD5I59HgZOGReFYm4dnWc1Qt5NtvYSaNcOP+u1T9qYdvdihz0PPSiiqn/+/3e7Jo4EaG7TubfWGUrMQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.19.0/jquery.validate.min.js"></script>

<script src="<?=URLROOT?>/js/submit-form.js" type="module"></script>

<?php View::footer(false) ?>