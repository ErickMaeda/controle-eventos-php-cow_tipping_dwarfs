<!DOCTYPE html>
<html lang="en">

    <head>

        {include file="comum/head.tpl"}

    </head>

    <body>

        <div id="wrapper">

            <!-- Sidebar -->
            {include file="comum/sidebar.tpl"}
            <!-- /#sidebar-wrapper -->

            <!-- Page Content -->
            <div id="page-content-wrapper">
                <div class="container-fluid">
                    <div class="row">

                        <div class="col-lg-12">
                            <h1>Color Edit</h1>
                            <form role="form" action="/color/update/id/{$registro.id}" method="POST" enctype="multipart/form-data">
                                <input type="hidden" class="form-control" id="id" name="id" value="{$registro.id}">

                                <div class="form-group">
                                    <label for="name">Name</label>
                                    <input required="true" type="input" class="form-control" id="name" name="name" value="{$registro.name}">
                                </div>  
                                <div class="form-group">
                                    <label for="name">Created</label>
                                    <input disabled type="input" class="form-control" id="created" name="created" value="{$registro.created}">
                                    <input  type="hidden" class="form-control" id="created" name="created" value="{$registro.created}">
                                </div> 
                                <div class="form-group">
                                    <label for="active">Active</label>                                    
                                    <select class="form-control" name = "active" id = "active">
                                        <option value="0" {if $registro.active eq 0} selected{/if}>Disabled</option>
                                        <option value="1" {if $registro.active eq 1} selected{/if}>Enabled</option>                                        
                                    </select >
                                </div> 

                                <button type="submit" class="btn btn-default">Update</button>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
            <!-- /#page-content-wrapper -->

        </div>
        <!-- /#wrapper -->

        {include file="comum/footer.tpl"}

    </body>

</html>
