<?php

namespace App\Controller;

use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;

class LoginController extends AbstractController
{
    /**
     * @Route("/login", name="app_dashboard")
     */
    public function index(Request $request): Response
    {
        return $this->render('login/index.html.twig');
    }
}
