<!DOCTYPE html>
<!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7"> <![endif]-->
<!--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8"> <![endif]-->
<!--[if IE 8]>         <html class="no-js lt-ie9"> <![endif]-->
<!--[if gt IE 8]><!--> <html class="no-js"> <!--<![endif]-->
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
        <title>{$sarasa.title}</title>
        <meta name="description" content="">
        <meta name="viewport" content="width=device-width">

        <link rel="stylesheet" href="/css/vendor/bootstrap.min.css">
        <link rel="stylesheet" href="/css/vendor/bootstrap-responsive.min.css">
        {foreach from=$sarasa.css item="css"}
        <link rel="stylesheet" type="text/css"  href="/css/{$css}" media="screen" />
        {/foreach}
        <script src="/js/vendor/modernizr-2.6.2.min.js"></script>
    </head>
    <body>
        <div id="loading">Loading...</div>
        <!--[if lt IE 7]>
            <p class="chromeframe">You are using an <strong>outdated</strong> browser. Please <a href="http://browsehappy.com/">upgrade your browser</a> or <a href="http://www.google.com/chromeframe/?redirect=true">activate Google Chrome Frame</a> to improve your experience.</p>
        <![endif]-->

        <div class="container">
            {include file="Sarasa/Views/_header.tpl"}
            {block name="container"}{/block}
        </div>
        
        <div class="dialogcontainer">

            <div id="dlgError" title="Error">
                <div id="dlgErrorMsg"></div>
            </div>

            {block name="dialogs"}{/block}
            
        </div>

        <script src="//ajax.googleapis.com/ajax/libs/jquery/1.10.1/jquery.min.js"></script>
        <script>window.jQuery || document.write('<script src="/js/vendor/jquery-1.10.1.min.js"><\/script>')</script>
        <script src="//ajax.googleapis.com/ajax/libs/jqueryui/1.10.3/jquery-ui.min.js"></script>
        <script>window.jQuery || document.write('<script src="/js/vendor/jquery-ui-1.10.3.min.js"><\/script>')</script>
        <script src="/js/plugins.js"></script>
        {foreach from=$sarasa.js item="js"}
        <script src="/js/{$js}"></script>
        {/foreach}
        {block name=scripts}{/block}

    </body>
</html>