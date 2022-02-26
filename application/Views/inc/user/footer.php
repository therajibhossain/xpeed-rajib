<link rel="stylesheet" href="<?=URLROOT?>/css/footer.css">
<div class="container">
    <footer class="pt-4 my-md-5 pt-md-5 border-top" id='page-footer'>
        <div class="row">
            <div class="col-12 col-md">
                <a href="#">
                <img class="mb-3 ms-4" src="<?=URLROOT?>/assets/logo.png" alt="" width="">
                </a>
                <small class="d-block mb-3 text-muted">© <?=date('Y')?></small>
            </div>
            <div class="col-6 col-md">
                <h5>Resources</h5>
                <ul class="list-unstyled text-small">
                    <li><a class="link-secondary <?=View::activeFooter("")?>" href="<?=URLROOT?>">Home</a></li>
                </ul>
            </div>
            <div class="col-6 col-md">
                <h5>Developers</h5>
                <ul class="list-unstyled text-small">
                    <li><a class="link-secondary <?=View::activeFooter("/info/contribute")?>" href="https://github.com/therajibhossain">Author</a></li>
                </ul>
            </div>
            <div class="col-6 col-md"></div>
            <div class="col-6 col-md">
                <ul class="list-unstyled text-small">
                    <li><a class="link-primary" href="#">Back To Top <i class="fas fa-caret-up"></i></a></li>
                </ul>
            </div>
        </div>
    </footer>
</div>