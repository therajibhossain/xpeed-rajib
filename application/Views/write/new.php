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

            <div class="alert alert-danger display-error" style="display: none"></div>

            <div class="col-md-8 col-12 order-md-1 order-2 ps-md-3 pe-md-0 py-4 p-0">
                <div class="p-md-4 bg-white rounded p-2 py-4" style='border: 1px solid #d7d7d7'>
                    <input type="number" class='form-control bg-white' placeholder="Amount" id='amount'><br>
                    <input type="text" class='form-control bg-white' placeholder="Buyer" id='buyer'><br>
                    <input type="text" class='form-control bg-white' placeholder="Reciept ID" id='receipt_id'><br>
                    <input type="text" class='form-control bg-white' placeholder="Items" id='items'><br>
                    <input type="email" class='form-control bg-white' placeholder="Buyer Email" id='buyer_email'><br>
                    <input type="text" class='form-control bg-white' placeholder="Note" id='note'><br>
                    <input type="text" class='form-control bg-white' placeholder="City" id='city'><br>
                    <input type="text" class='form-control bg-white' placeholder="Phone" id='phone'><br>
                    <!-- <textarea type="text" class='form-control bg-white shadow-none' id="tagline" placeholder="Tagline" name="tagline"></textarea> -->
                    <!-- <br> -->
                    <!-- <div id="editor" class='bg-white' style="display: none"></div> -->
                    <!-- <div id="counter">characters</div><br> -->
                    <button class="btn btn-success px-3 float-end d-block mt-1" id="submit-post">Submit</button>
                    <div style='margin-bottom: 40px'></div>
                </div>
            </div>

        </div>
    </div>


    <div class="error-div"></div>

    <div class="toast align-items-center text-white bg-dark border-0 center-toast" role="alert" aria-live="assertive" aria-atomic="true" id='draft-err-toast' style='max-width: 5000px!important; padding: 2px; font-size: 15px'>
        <div class="d-flex">
            <div class="toast-body container">
                Draft Error   <i class="fas fa-circle-notch fa-spin"></i>                        
            </div>
            <button type="button" class="btn-close btn-close-white me-2 m-auto toast-close" data-bs-dismiss="toast" aria-label="Close"></button>
        </div>
    </div>
    <br><br><br>
</main>
<?=View::formToken(IMG_VALIDATE_URL, "img_valid_url")?>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
  <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js" integrity="sha512-894YE6QWD5I59HgZOGReFYm4dnWc1Qt5NtvYSaNcOP+u1T9qYdvdihz0PPSiiqn/+/3e7Jo4EaG7TubfWGUrMQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>


<script src="<?=URLROOT?>/js/submit-form.js" type="module"></script>
<script type="module">
// import{URL,newTokenData,isJson}from"<?=URLROOT?>/js/script.js";


// document.querySelector("#save-draft").addEventListener("click",function(){const e=newTokenData({title:document.querySelector("#title").value,tagline:document.querySelector("#tagline").value,content:document.querySelector(".ql-editor").innerHTML,draft_name:document.querySelector("#draft_name").value});fetch(`${URL}/ajax/write/save-draft`,{method:"POST",body:e}).then(e=>e.text()).then(e=>{if(isJson(e)){let t=document.getElementById("draft-err-toast"),a=new bootstrap.Toast(t,{delay:6e3}),o=JSON.parse(e);200===o.status?location.replace(`${URL}/write/draft/${o.draft_id}`):(delete o.status,t.querySelector(".toast-body").innerHTML=`${o[Object.keys(o)[0]]}`,a.show())}})});
</script>
<?php View::footer(false) ?>