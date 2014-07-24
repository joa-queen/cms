<?php

require_once "../vendor/autoload.php";

use Sarasa\Core\FrontController;
use Sarasa\Core\Template;
use Sarasa\Core\AjaxResponse;
use Sarasa\Core\CustomException;
use Sarasa\Core\Lang;

$er = ((\Sarasa\Core\FrontController::config('production') || (isset($_SERVER['HTTP_AJAX_FUNCTION']) && $_SERVER['HTTP_AJAX_FUNCTION'] == 'debugbar')) ? 0 : E_ALL);
error_reporting($er);

session_start();
try {
    $action = FrontController::route();

    $controllername = FrontController::$bundle . '\Controllers\\' . FrontController::$controller;
    $controllereval = '$controller = new ' . $controllername . '();';
    eval($controllereval);

    try {
        $reflection = new ReflectionMethod($controllername, $action);
        $parameters = $reflection->getParameters();
        $params = array();

        foreach ($parameters as $parameter) {
            if (isset(FrontController::$parameters[$parameter->name])) {
                $params[] = '\Sarasa\Core\FrontController::$parameters["' . $parameter->name . '"]';
            } else {
                $params[] = 'null';
            }
        }

        $func = '$controller->' . $action . '(' . implode(', ', $params) . ');';
        if (!method_exists($controllername, $action)) {
            throw new CustomException("No se encontró la acción", 404);
        }
        eval($func);
    } catch (Exception $e) {
        FrontController::handlePageException($e);
    }
} catch (Exception $e) {
    Template::error500($e);
}
