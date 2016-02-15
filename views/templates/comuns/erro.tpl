{include file="comuns/head.tpl"}
<div id="wrapper">
    <!-- Sidebar -->
    {include file="comuns/sidebar.tpl"}    
    <div id="page-wrapper">
        <!-- Sidebar -->
        {include file="comuns/sidebar.tpl"}        
        <!--Altere daqui pra baixo-->


        <div id="page-wrapper">
            <div class="row">
                <div class="col-lg-12">
                    <h1>Erro <small>oops!</small></h1>                  
                    <p>{$msg|default:""}</p>
                </div>
            </div><!-- /.row -->

        </div><!-- /#page-wrapper -->

        <!--Altere daqui pra cima-->
    </div>
</div>

<!-- JavaScript -->
<script src="/files/js/jquery-1.10.2.js"></script>
<script src="/files/js/bootstrap.js"></script>
<!-- Toast Message -->
<script src="/files/js/toastmessage/javascript/jquery.toastmessage.js"></script>
<!-- Utils -->
<script src="/files/js/util.js"></script>
<!-- Blank JS -->
<!--<script src="/files/js/blank/blank.js"></script> -->
{include file="comuns/footer.tpl"}