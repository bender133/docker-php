<?php

namespace App\Controller;

use DateTime;
use Doctrine\DBAL\Connection;
use Exception;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\JsonResponse;
use Symfony\Component\HttpKernel\Kernel;
use Symfony\Component\Routing\Attribute\Route;

class HealthController extends AbstractController
{
    public function __construct(
        private readonly Connection $connection
    ) {
    }

    #[Route('/api/health', name: 'api_health', methods: ['GET'])]
    public function health(): JsonResponse
    {
        $dbStatus = 'connected';
        try {
            $this->connection->executeQuery('SELECT 1');
        } catch (Exception $e) {
            $dbStatus = 'disconnected: ' . $e->getMessage();
        }

        return new JsonResponse([
            'status'          => 'ok',
            'timestamp'       => (new DateTime())->format('Y-m-d H:i:s'),
            'symfony_version' => Kernel::VERSION,
            'php_version'     => PHP_VERSION,
            'database'        => $dbStatus,
            'environment'     => $this->getParameter('kernel.environment'),
        ]);
    }
}
