<div id="sidebar-wrapper">
    <ul class="sidebar-nav">
        <li class="sidebar-brand">
            <a href="/">
                Chayotator PRO-3000
            </a>
        </li>
        <li>
            <a href="/">Home</a>
        </li>

        <li>
            <a href="/participacao">Participações</a>
        </li>
        
        <li>
            <a href="/cracha">Emitir Crachá</a>
        </li>
        
        <li>
            <a data-toggle="collapse" data-target="#cadastro"><i class="fa fa-fw fa-edit"></i> Cadastros <i class="fa fa-fw fa-caret-down"></i></a>
            <ul id="cadastro" class="collapse">
                
                <li>
                    <a href="/usuario">Usuário</a>
                </li>
                <li>
                    <a href="/cliente">Cliente</a>
                </li>
                <li>
                    <a href="/evento">Evento</a>
                </li>
                <li>
                    <a href="/cidade">Cidade</a>
                </li>
                <li>
                    <a href="/estado">Estado</a>
                </li>
                <li>
                    <a href="/departamento">Departamento</a>
                </li>
                <li>
                    <a href="/produto">Produto</a>
                </li>
            </ul>
        </li>
        {if isset($_SESSION['usuario'])}
            <li>
                <a href="/login">Sair</a>
            </li>
        {/if}
    </ul>
</div>
