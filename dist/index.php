<?php
error_reporting(E_ALL);
ini_set("display_errors", 1);

require_once('sophwork/autoloader.php');

use sophwork\core\Sophwork;
use sophwork\app\app\SophworkApp;

use controller\controllers\core\Controllers;

if(!file_exists('config.local.php'))
	Sophwork::redirect('install');

$app = new SophworkApp();
$appController = $app->appController;
$pageController = new Controllers();
$pageController->callThemeView('index');