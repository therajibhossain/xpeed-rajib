<?php 

declare(strict_types = 1); 

class Write extends ProtectedController {
    private $writeModel;
    private $articleModel;

    use WriteTraits;

    public function __grandchildConstruct() {
        $this->writeModel = $this->model('WriteModel');
    }

    /**
     * Redirect to new article page
     * 
     * @route
     */
    public function index() {Server::redirect('write/new');}

    /**
     * Show view to create new article / draft
     * 
     * @route
     */
    public function new() {
        $this->view('write/new');
    }

}