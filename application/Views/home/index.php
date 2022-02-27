<?php View::header(true, 'Home') ?>
<div style='padding-bottom: 24px;'></div>
<link rel="stylesheet" href="<?=URLROOT?>/css/home.css">
<div class="container-fluid">
    <div class="row">
        <div class="col-lg-2 d-lg-inline d-none bg-light px-4 pt-1">
            <div class="card mx-2 mt-5">
                <div class="card-body">
                    <div class="row">
                        <div class="col-2 col-sm-3">
                            <span class="user-img d-inline-block me-3" style='background-image: url(<?=PROFILE_IMG_DIR?>/<?=$_SESSION['profile_img']?>);'></span> 
                        </div>
                        <a class="col text-dark text-decoration-none" href="<?=URLROOT?>/settings/edit-profile">
                            <b class='d-block'><?=ht($_SESSION['display_name'])?></b>
                            <small class="text-muted">@<?=ht($_SESSION['username'])?></small>
                        </a>
                        <br><br><br>
                        <a href="<?=URLROOT?>/write" class="text-dark text-decoration-none d-block py-2"><i class="fas fa-arrow-right pe-2"></i> New Form</a>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-lg-10 col-md-8 col-12 bg-light">
            <h2 class='mt-2'>Submitted Forms</h2><br>
            <div class="articles-container m-0 p-0">
                <?php require_once APPROOT.'/Views/home/datatable.php'; ?>
            </div>
        </div>
    </div>
</div>

<script src="<?=URLROOT?>/js/home.js"></script>
<?php View::footer() ?>
