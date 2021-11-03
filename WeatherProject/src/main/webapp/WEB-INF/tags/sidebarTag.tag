<%@ tag language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<aside class="left-sidebar" data-sidebarbg="skin6">
            <!-- Sidebar scroll-->
            <div class="scroll-sidebar">
                <!-- Sidebar navigation-->
                <nav class="sidebar-nav">
                    <ul id="sidebarnav">
                        <!-- User Profile-->
                        <li>
                            <!-- User Profile-->
                            <c:if test="${userInfo == null}">
                             <div class="user-profile d-flex no-block dropdown m-t-20">
                                <div class="user-pic"><img src="assets/images/users/1.jpg" alt="users" class="rounded-circle" width="40" /></div>
                                <div class="user-content hide-menu m-l-10">
                                    <a href="javascript:void(0)" class="" id="Userdd" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                        <h5 class="m-b-0 user-name font-medium">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;로그인하세요.</h5>
                                        <span class="op-5 user-email">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;반갑습니다!</span>
                                    </a> 
                                </div>
                            </div>
                            </c:if>
                            <c:if test="${userInfo != null}">
                            <div class="user-profile d-flex no-block dropdown m-t-20">
                                <div class="user-pic"><img src="${userInfo.image}" alt="users" class="rounded-circle" width="40" /></div>
                                <div class="user-content hide-menu m-l-10">
                                    <a href="javascript:void(0)" class="" id="Userdd" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                        <h5 class="m-b-0 user-name font-medium">&nbsp;&nbsp;&nbsp;${userInfo.name} <i class="fa fa-angle-down"></i></h5>
                                        <span class="op-5 user-email">&nbsp;&nbsp;&nbsp;${userInfo.email}</span>
                                    </a>
                                    <div class="dropdown-menu dropdown-menu-right" aria-labelledby="Userdd">
                                        <a class="dropdown-item" href="pages-profile.jsp"><i class="ti-user m-r-5 m-l-5"></i> My Profile</a>
                                        <a class="dropdown-item" href="javascript:void(0)"><i class="ti-wallet m-r-5 m-l-5"></i> My Balance</a>
                                        <a class="dropdown-item" href="javascript:void(0)"><i class="ti-email m-r-5 m-l-5"></i> Inbox</a>
                                        <div class="dropdown-divider"></div>
                                        <a class="dropdown-item" href="javascript:void(0)"><i class="ti-settings m-r-5 m-l-5"></i> Account Setting</a>
                                        <div class="dropdown-divider"></div>
                                        <a class="dropdown-item" href="logout.do"><i class="fa fa-power-off m-r-5 m-l-5"></i> Logout</a>
                                    </div>
                                </div>
                            </div>
                            </c:if>
                            <!-- End User Profile-->
                        </li>
                        <li class="p-15 m-t-10"><a href="join.jsp" class="btn btn-block create-btn text-white no-block d-flex align-items-center"><i class="fa fa-plus-square"></i> <span class="hide-menu m-l-5">Create New</span> </a></li>
                        <!-- User Profile-->
                        <li class="sidebar-item"> <a class="sidebar-link waves-effect waves-dark sidebar-link" href="index.do" aria-expanded="false"><i class="mdi mdi-view-dashboard"></i><span class="hide-menu">Dashboard</span></a></li>
                        <c:if test="${userInfo != null }">
                        <li class="sidebar-item"> <a class="sidebar-link waves-effect waves-dark sidebar-link" href="pages-profile.jsp" aria-expanded="false"><i class="mdi mdi-account-network"></i><span class="hide-menu">Profile</span></a></li>
                        </c:if>
                        <li class="sidebar-item"> <a class="sidebar-link waves-effect waves-dark sidebar-link" href="comments.do" aria-expanded="false"><i class="mdi mdi-comment-outline"></i><span class="hide-menu">Comments</span></a></li>
                        <li class="sidebar-item"> <a class="sidebar-link waves-effect waves-dark sidebar-link" href="table-basic.html" aria-expanded="false"><i class="mdi mdi-border-all"></i><span class="hide-menu">Table</span></a></li>
                        <li class="sidebar-item"> <a class="sidebar-link waves-effect waves-dark sidebar-link" href="icon-material.html" aria-expanded="false"><i class="mdi mdi-face"></i><span class="hide-menu">Icon</span></a></li>
                        
                        <li class="sidebar-item"> <a class="sidebar-link waves-effect waves-dark sidebar-link" href="error-404.html" aria-expanded="false"><i class="mdi mdi-alert-outline"></i><span class="hide-menu">404</span></a></li>
                        <!-- 
                        <li class="text-center p-40 upgrade-btn">
                            <a href="https://wrappixel.com/templates/xtremeadmin/" class="btn btn-block btn-danger text-white" target="_blank">Upgrade to Pro</a>
                        </li>
                         -->
                    </ul>
                    
                </nav>
                <!-- End Sidebar navigation -->
            </div>
            <!-- End Sidebar scroll-->
        </aside>
       