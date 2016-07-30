<%@ Page Title="" Language="C#" MasterPageFile="~/admin/MasterPage.master" AutoEventWireup="true"
    CodeFile="default.aspx.cs" Inherits="admin_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="Server">
    <script type="text/javascript" src="https://www.google.com/jsapi"></script>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="CPH1" runat="Server">


    <div class="page-head-x4"><%= Resources.admin_language.default_welcome %></div>
    <div class="page-head-x1"><%= Resources.admin_language.default_help %></div>

    <div id="global_errors" class="errors-out">
        <div class="errors-in">
        </div>
    </div>

    <div class="row">
        <div class="col-md-6">

            <div class="panel">
                <div class="panel-heading"><%= Resources.admin_language.default_start %></div>
                <div class="panel-body">
                    <div class="row">
                        <div class="col-sm-12">
                            <div class="page-head-x1"><%= Resources.admin_language.default_quick %></div>
                        </div>
                    </div>
                    <div class="row mb-md quick-tools">
                        <div class="col-sm-3">
                            <div class="box box-grey box-padding-sm text-center">
                                <p><a href="menus.aspx"><i class="fa fa-list fa-3x"></i></a></p>
                                <p><a href="menus.aspx"><%= Resources.admin_language.master_menus %></a></p>
                            </div>
                        </div>
                        <div class="col-sm-3">
                            <div class="box box-grey box-padding-sm text-center">
                                <p><a href="articles.aspx"><i class="fa fa-file-text fa-3x"></i></a></p>
                                <p><a href="articles.aspx"><%= Resources.admin_language.master_articles %></a></p>
                            </div>
                        </div>
                        <div class="col-sm-3">
                            <div class="box box-grey box-padding-sm text-center">
                                <p><a href="news.aspx"><i class="fa fa-newspaper-o fa-3x"></i></a></p>
                                <p><a href="news.aspx"><%= Resources.admin_language.master_news %></a></p>
                            </div>
                        </div>
                        <div class="col-sm-3">
                            <div class="box box-grey box-padding-sm text-center">
                                <p><a href="announcements.aspx"><i class="fa fa-bullhorn fa-3x"></i></a></p>
                                <p><a href="announcements.aspx"><%= Resources.admin_language.master_announs_1 %></a></p>
                            </div>
                        </div>
                    </div>
                    <div class="row mb-md quick-tools">
                        <div class="col-sm-3">
                            <div class="box box-grey box-padding-sm text-center">
                                <p><a href="polls.aspx"><i class="fa fa-check-square-o fa-3x"></i></a></p>
                                <p><a href="polls.aspx"><%= Resources.admin_language.master_polls %></a></p>
                            </div>
                        </div>
                        <div class="col-sm-3">
                            <div class="box box-grey box-padding-sm text-center">
                                <p><a href="photo-galleries.aspx"><i class="fa fa-picture-o fa-3x"></i></a></p>
                                <p><a href="photo-galleries.aspx"><%= Resources.admin_language.master_gallery %></a></p>
                            </div>
                        </div>
                        <div class="col-sm-3">
                            <div class="box box-grey box-padding-sm text-center">
                                <p><a href="guestbook.aspx"><i class="fa fa-book fa-3x"></i></a></p>
                                <p><a href="guestbook.aspx"><%= Resources.admin_language.master_guest_book %></a></p>
                            </div>
                        </div>
                        <div class="col-sm-3">
                            <div class="box box-grey box-padding-sm text-center">
                                <p><a href="activities.aspx"><i class="fa fa-calendar-o fa-3x"></i></a></p>
                                <p><a href="activities.aspx"><%= Resources.admin_language.master_activites %></a></p>
                            </div>
                        </div>
                    </div>
                    <div class="row mb-md quick-tools">
                        <div class="col-md-3">
                            <div class="box box-grey box-padding-sm text-center">
                                <p><a href="members.aspx"><i class="fa fa-users fa-3x"></i></a></p>
                                <p><a href="members.aspx"><%= Resources.admin_language.master_users %></a></p>
                            </div>
                        </div>
                        <div class="col-md-3">
                            <div class="box box-grey box-padding-sm text-center">
                                <p><a href="pages.aspx"><i class="fa fa-files-o fa-3x"></i></a></p>
                                <p><a href="pages.aspx"><%= Resources.admin_language.master_pages %></a></p>
                            </div>
                        </div>
                        <div class="col-md-3">
                            <div class="box box-grey box-padding-sm text-center">
                                <p><a href="templates.aspx"><i class="fa fa-file-image-o fa-3x"></i></a></p>
                                <p><a href="templates.aspx"><%= Resources.admin_language.master_templates %></a></p>
                            </div>
                        </div>

                        <div class="col-md-3">
                            <div class="box box-grey box-padding-sm text-center">
                                <p><a href="member-detail.aspx?dil=<%= Snlg_ConfigValues.defaultLangId %>&uid=<%= Snlg_MemberInfo.s_UserId %>"><i class="fa fa-user fa-3x"></i></a></p>
                                <p><a href="member-detail.aspx?dil=<%= Snlg_ConfigValues.defaultLangId %>&uid=<%= Snlg_MemberInfo.s_UserId %>"><%= Resources.admin_language.master_my_information %></a></p>
                            </div>
                        </div>
                    </div>

                </div>
            </div>
        </div>


        <div class="col-md-6">
            <div class="panel">
                <div class="panel-heading"><%= Resources.admin_language.default_statistic %></div>
                <div class="panel-body">
                    <div class="row">
                        <div class="col-sm-12">
                            <div class="page-head-x1"><%= Resources.admin_language.default_statistic_help %></div>
                        </div>
                    </div>
                    <div class="row mb-md">
                        <div class="col-md-3">
                            <div class="box box-grey box-padding-sm">
                                <asp:Literal ID="HL1" runat="server" />
                            </div>
                        </div>
                        <div class="col-md-3">
                            <div class="box box-grey box-padding-sm">
                                <asp:Literal ID="HL2" runat="server" />
                            </div>
                        </div>
                        <div class="col-md-3">
                            <div class="box box-grey box-padding-sm">
                                <asp:Literal ID="HL3" runat="server" />
                            </div>
                        </div>
                        <div class="col-md-3">
                            <div class="box box-grey box-padding-sm">
                                <asp:Literal ID="HL4" runat="server" />
                            </div>
                        </div>
                    </div>

                </div>
            </div>
        </div>
    </div>
</asp:Content>
