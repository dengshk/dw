<!-- BEGIN SIDEBAR -->
<div class="page-sidebar-wrapper">
    <!-- BEGIN SIDEBAR -->
    <!-- DOC: Set data-auto-scroll="false" to disable the sidebar from auto scrolling/focusing -->
    <!-- DOC: Change data-auto-speed="200" to adjust the sub menu slide up/down speed -->
    <div class="page-sidebar navbar-collapse collapse">
        <!-- BEGIN SIDEBAR MENU -->
        <!-- DOC: Apply "page-sidebar-menu-light" class right after "page-sidebar-menu" to enable light sidebar menu style(without borders) -->
        <!-- DOC: Apply "page-sidebar-menu-hover-submenu" class right after "page-sidebar-menu" to enable hoverable(hover vs accordion) sub menu mode -->
        <!-- DOC: Apply "page-sidebar-menu-closed" class right after "page-sidebar-menu" to collapse("page-sidebar-closed" class must be applied to the body element) the sidebar sub menu mode -->
        <!-- DOC: Set data-auto-scroll="false" to disable the sidebar from auto scrolling/focusing -->
        <!-- DOC: Set data-keep-expand="true" to keep the submenues expanded -->
        <!-- DOC: Set data-auto-speed="200" to adjust the sub menu slide up/down speed -->
        <ul class="page-sidebar-menu  page-header-fixed " data-keep-expanded="false" data-auto-scroll="true" data-slide-speed="200" style="padding-top: 20px">
            <!-- DOC: To remove the sidebar toggler from the sidebar you just need to completely remove the below "sidebar-toggler-wrapper" LI element -->
            <li class="sidebar-toggler-wrapper hide">
                <!-- BEGIN SIDEBAR TOGGLER BUTTON -->
                <div class="sidebar-toggler">
                    <span></span>
                </div>
                <!-- END SIDEBAR TOGGLER BUTTON -->
            </li>
            <!-- DOC: To remove the search box from the sidebar you just need to completely remove the below "sidebar-search-wrapper" LI element -->
            <!-- <li class="sidebar-search-wrapper"> -->
                <!-- BEGIN RESPONSIVE QUICK SEARCH FORM -->
                <!-- DOC: Apply "sidebar-search-bordered" class the below search form to have bordered search box -->
                <!-- DOC: Apply "sidebar-search-bordered sidebar-search-solid" class the below search form to have bordered & solid search box -->
                <!-- 
                <form class="sidebar-search  " action="page_general_search_3.html" method="POST">
                    <a href="javascript:;" class="remove">
                        <i class="icon-close"></i>
                    </a>
                    <div class="input-group">
                        <input type="text" class="form-control" placeholder="Search...">
                        <span class="input-group-btn">
                            <a href="javascript:;" class="btn submit">
                                <i class="icon-magnifier"></i>
                            </a>
                        </span>
                    </div>
                </form>
                <!-- END RESPONSIVE QUICK SEARCH FORM -->
           <!--</li> -->
            <#if Session.user_op_rights?? && Session.user_op_rights?size &gt; 0>
                <#list Session.user_op_rights as resource>
                    <#if resource.parentid == 0>
                        <#if resource.subRight?? && resource.subRight?size &gt; 0>
                            <li class="nav-item 
                                <#if resource_index==0>start </#if>
                                <#if Session.user_op_active==resource.rightid || Session.user_op_parent_active==resource.rightid>active </#if>
                                <#list resource.subRight as sub>
                                    <#if Session.user_op_active==sub.rightid || Session.user_op_parent_active==sub.rightid>active </#if>
                                </#list>
                            ">
                            <a href="javascript:;" class="nav-link nav-toggle">
                                <i class="<#if resource.skins??>${resource.skins}</#if>"></i>
                                <span class="title">${resource.rightname!}</span>
                                    <#if Session.user_op_active==resource.rightid || Session.user_op_parent_active==resource.rightid>
                                        <span class="selected"></span>
                                    </#if>
                                <span class="arrow 
                                    <#list resource.subRight as sub>
                                        <#if Session.user_op_active==sub.rightid || Session.user_op_parent_active==sub.rightid>open </#if>
                                    </#list> >"
                                </span>
                            </a>
                            <ul class="sub-menu">
                                <#list resource.subRight as sub>
                                    <li class="nav-item start 
                                        <#if Session.user_op_active==sub.rightid || Session.user_op_parent_active==sub.rightid>active open </#if>
                                    ">
                                        <a href="${application.getContextPath()}${sub.url}?op_menu=${sub.rightid}">
                                            <i class="<#if sub.skins??>${sub.skins}</#if>"></i>
                                            <span class="title">${sub.rightname!}</span>
                                        </a>
                                    </li>
                                </#list>
                            </ul>
                        </li>
                        <#else>
                            <li class="<#if resource_index==0>start </#if><#if Session.user_op_active==resource.rightid || Session.user_op_parent_active==resource.rightid>active</#if>" >
                                <a href="${application.getContextPath()}${resource.url}?op_menu=${resource.rightid}">
                                    <i class="<#if resource.skins??>${resource.skins}</#if>"></i> 
                                    <span class="title">${resource.rightname!}</span>
                                    <#if Session.user_op_active==resource.rightid || Session.user_op_parent_active==resource.rightid>
                                        <span class="selected"></span>
                                    </#if>
                                </a>
                            </li>
                        </#if>
                    </#if>
                </#list>
                <!--
                <li class="heading">
                    <h3 class="uppercase">Others</h3>
                </li>
                -->
            </#if>
        </ul>
        <!-- END SIDEBAR MENU -->
        <!-- END SIDEBAR MENU -->
    </div>
    <!-- END SIDEBAR -->
</div>
<!-- END SIDEBAR -->