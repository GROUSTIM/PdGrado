<?php

namespace App\Controller;

use App\Entity\TestUserRole;
use App\Entity\UserRole;
use App\Entity\UserRoles;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Attribute\Route;
use Symfony\Component\Security\Core\User\UserInterface;

class HomeController extends AbstractController
{
    #[Route('/home', name: 'app_home')]
    public function index(EntityManagerInterface $em, UserInterface $user): Response
    {
        $userRole = $em->getRepository(UserRoles::class)->findOneBy(['users'=>$user->getId()]);
        $persona = $user->getPerson();
        return $this->render('home/index.html.twig', [
            'controller_name' => 'HomeController',
            'email'=>$user->getEmail(),
            'nombres'=>$persona->getNombre(),
            'apellidos'=>$persona->getApellido(),
            'sexo'=>$persona->getSexo(),
            'edad'=>$persona->getEdad(),
            'role'=>$userRole->getRoles()->getNombres(),

        ]);
    }
}