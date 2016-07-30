<%@ Page Title="" Language="C#" MasterPageFile="~/admin/MasterPage.master" AutoEventWireup="true" CodeFile="project-categories.aspx.cs" Inherits="admin_project_categories" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="Server">
    <script type="text/javascript">
        $(document).ready(function () {
            $(".buttons:first div").html($(".buttons:first div").html() + $("[data-buttons]").html());

            Gizle();

            $('.sidebar-nav i.fa-long-arrow-up').click(function () {
                if ($(this).closest('li').index() > 0)
                    $(this).closest('li').prev().before($(this).closest('li'));
                Gizle();
                SaveOrderMenu();
            });
            $('.sidebar-nav i.fa-long-arrow-down').click(function () {
                if ($(this).closest('li').index() < ($(this).closest('ul').find('>li').length - 1))
                    $(this).closest('li').next().after($(this).closest('li'));
                Gizle();
                SaveOrderMenu();
            });
        });

        function Gizle() {
            $('.sidebar-nav i.fa-long-arrow-up, .sidebar-nav i.fa-long-arrow-down').css("visibility", "visible");
            $('.sidebar-nav li').each(function () {
                if ($(this).index() == 0)
                    $(this).find('>div>i.fa-long-arrow-up,>i.fa-long-arrow-up').css("visibility", "hidden");
                if ($(this).index() == $(this).closest('ul').find('>li').length - 1)
                    $(this).find('>div>i.fa-long-arrow-up,>i.fa-long-arrow-down').css("visibility", "hidden");
            });
        }

        function SaveOrderMenu() {
            var siralama = "";
            $('.sidebar-nav ul').each(function () {
                $(this).find('>li').each(function () {
                    siralama = siralama + $(this).attr('id') + ',';
                });
                siralama = siralama + ';';
            });
            siralama = siralama.substring(0, siralama.length - 2);
            $.ajax({
                type: "POST",
                url: "<%= Request.Url.AbsolutePath %>/Siralama_Kaydet",
                data: '{ "_siralama":"' + siralama + '" }',
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (sonuc) {
                },
                error: function () {
                    bootbox.alert('Sıralama kaydedilirken <%= Resources.admin_language.eror_unexcepted %>');
                }
            });
        }
    </script>

    
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="CPH1" runat="Server">
    <div class="row urunKategorileri">
        <div class="col-md-12">

            <div class="page-head-x4"><%= Resources.admin_language.project_cat_title %></div>
            <div class="page-head-x1">
                <%= Resources.admin_language.project_cat_help %>
            </div>
            <div id="global_errors" class="errors-out">
                <div class="errors-in">
                </div>
            </div>

            <div class="row mb-md buttons" data-spy="affix" data-offset-top="150">
                <div class="col-md-12">
                    <asp:LinkButton ID="BtnSil" ImageUrl="<%= Snlg_ConfigValues.AdminThemePath %>images/icon_sil.png" runat="server" Text="<%$ Resources:admin_language, menu_delete2 %>"
                        data-bb="confirm" data-confirm-text="Silmek istediğinizden emin misiniz?"
                        class="btn btn-danger icon_sil" OnClick="LKtgSil_Click"></asp:LinkButton>

                </div>
            </div>


            <div class="row">
                <div class="col-md-3">

                    <div class="panel">
                        <div class="panel-heading"><%= Resources.admin_language.project_cat_list %></div>
                        <div class="panel-body">

                            <div class="sidebar-nav">
                                <ul class="accordion menu">
                                    <asp:Literal ID="ltrMenu" Text="" runat="server" />
                                </ul>
                            </div>

                        </div>
                    </div>
                </div>

                <div class="col-md-9">
                    <div class="panel">
                        <div class="panel-heading">
                            <asp:Label ID="LblFBas" runat="server"></asp:Label>
                        </div>
                        <div class="panel-body">
                            <input type="hidden" name="HdnYeni" />
                            <div class="row sayfaDuzenle">
                                <asp:FormView ID="FVSyf" runat="server" DataKeyNames="KtgId" DataSourceID="SDSSyf"
                                    DefaultMode="Edit" OnDataBound="FVSyf_DataBound">
                                    <EditItemTemplate>
                                        <div class="panel">
                                            <div class="col-md-12">
                                                <div class="row form-group no-gutter flags ">
                                                    <label class="col-md-4"><%= Resources.admin_language.edit_lang %></label>
                                                    <div class="col-md-6"><%# DilleriListele(Eval("Diller")) %></div>

                                                </div>
                                                <div class="row form-group no-gutter">
                                                    <label class="col-md-4"><%= Resources.admin_language.article_cat_name %></label>
                                                    <div class="col-md-8">
                                                        <asp:TextBox ID="TBKtgAd" CssClass="form-control" runat="server" Text='<%# Bind("KtgAd") %>' MaxLength="200" />
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="TBKtgAd" CssClass="hata"
                                                            Display="Dynamic" ErrorMessage="*" ValidationGroup="sekle" SetFocusOnError="true"></asp:RequiredFieldValidator>
                                                    </div>
                                                </div>
                                                <div class="row form-group no-gutter">
                                                    <label class="col-md-4"><%= Resources.admin_language.article_cat_url %></label>
                                                    <div class="col-md-8">
                                                        <div class="input-group">
                                                            <asp:TextBox ID="TxtUrl" CssClass="form-control" runat="server" MaxLength="200" Text='<%# Bind("SeoUrl") %>'></asp:TextBox>
                                                            <span class="input-group-addon"><%= Snlg_ConfigValues.urlExtension %></span>
                                                        </div>

                                                    </div>
                                                </div>
                                                <div class="row form-group no-gutter">
                                                    <label class="col-md-4"><%= Resources.admin_language.article_add_meta %></label>
                                                    <div class="col-md-8">
                                                        <asp:TextBox ID="TBKey" CssClass="form-control" runat="server" Text='<%# Bind("Keyword") %>' MaxLength="500"></asp:TextBox>
                                                    </div>
                                                </div>
                                                <div class="row form-group no-gutter">
                                                    <label class="col-md-4"><%= Resources.admin_language.article_add_desc %></label>
                                                    <div class="col-md-8">
                                                        <asp:TextBox ID="TBDesc" CssClass="form-control" runat="server" Text='<%# Bind("Descr") %>' MaxLength="500"></asp:TextBox>
                                                    </div>
                                                </div>
                                                <div class="row form-group no-gutter">
                                                    <label class="col-md-4"><%= Resources.admin_language.article_add_img %></label>
                                                    <div class="col-md-8">

                                                          <asp:HiddenField ID="HdnImg" runat="server" Value='<%# Bind("Resim") %>' />
                                                          <img src='<%# Eval("Resim") %>' style="max-width: 150px; max-height: 150px;" id="sanalogFileImage" />
                                                         <a href="javascript:void(0)" class="btn btn-success btn-sm fileinput-button icon_yeni"  onclick="SnlgOpenSingleManager('<%=FVSyf.FindControl("HdnImg").ClientID %>');"><%= Resources.admin_language.article_add_image %></a>

                                                        <asp:LinkButton ID="BtnRSil" runat="server" class="btn btn-danger icon_sil" Visible='<%# !string.IsNullOrEmpty(Eval("Resim").ToString()) %>'
                                                            OnClick="BtnRSil_Click" Text="<%$ Resources:admin_language, delete %>" title="Resmi Sil"></asp:LinkButton>
                                                    </div>
                                                </div>
                                                <div class="row form-group no-gutter">
                                                    <label class="col-md-4"><%= Resources.admin_language.active %></label>
                                                    <div class="col-md-8">
                                                        <asp:CheckBox ID="CBAktif" runat="server" Checked='<%# Bind("Aktif") %>' />
                                                    </div>
                                                </div>
                                                <div class="row form-group no-gutter">
                                                    <label class="col-md-4"><%= Resources.admin_language.article_cat_select %></label>
                                                    <div class="col-md-8">

                                                        <asp:DropDownList ID="DDLUst" CssClass="form-control" runat="server">
                                                        </asp:DropDownList>
                                                    </div>
                                                </div>
                                            </div>

                                        </div>

                                        <div data-buttons="1" style="display: none">
                                            <asp:LinkButton ID="LinkButton1" CommandName="Update" ValidationGroup="sduzenle" Text="<%$ Resources:admin_language, save %>" runat="server" class="btn btn-info"></asp:LinkButton>
                                            <a href="project-categories.aspx" class="btn btn-default icon_kapat"><%= Resources.admin_language.close %></a>
                                        </div>
                                    </EditItemTemplate>
                                    <InsertItemTemplate>
                                        <div class="panel">
                                            <div class="col-md-12">
                                                <div class="row form-group no-gutter">
                                                    <label class="col-md-4"><%= Resources.admin_language.article_cat_name %></label>
                                                    <div class="col-md-8">
                                                        <asp:TextBox ID="TBKtgAd" CssClass="form-control" runat="server" Text='<%# Bind("KtgAd") %>' MaxLength="200" />
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="TBKtgAd" CssClass="hata"
                                                            Display="Dynamic" ErrorMessage="*" ValidationGroup="sekle" SetFocusOnError="true"></asp:RequiredFieldValidator>
                                                    </div>
                                                </div>
                                                <div class="row form-group no-gutter">
                                                    <label class="col-md-4"><%= Resources.admin_language.article_cat_url %></label>
                                                    <div class="col-md-8">
                                                        <div class="input-group">
                                                            <asp:TextBox ID="TxtUrl" CssClass="form-control" runat="server" MaxLength="200" Text='<%# Bind("SeoUrl") %>'></asp:TextBox>
                                                            <span class="input-group-addon"><%= Snlg_ConfigValues.urlExtension %></span>
                                                        </div>

                                                    </div>
                                                </div>
                                                <div class="row form-group no-gutter">
                                                    <label class="col-md-4"><%= Resources.admin_language.article_add_meta %></label>
                                                    <div class="col-md-8">
                                                        <asp:TextBox ID="TBKey" CssClass="form-control" runat="server" Text='<%# Bind("Keyword") %>' MaxLength="500"></asp:TextBox>
                                                    </div>
                                                </div>
                                                <div class="row form-group no-gutter">
                                                    <label class="col-md-4"><%= Resources.admin_language.article_add_desc %></label>
                                                    <div class="col-md-8">
                                                        <asp:TextBox ID="TBDesc" CssClass="form-control" runat="server" Text='<%# Bind("Descr") %>' MaxLength="500"></asp:TextBox>
                                                    </div>
                                                </div>
                                                <div class="row form-group no-gutter">
                                                    <label class="col-md-4"><%= Resources.admin_language.article_add_img %></label>
                                                    <div class="col-md-8">

                                                       <asp:HiddenField ID="HdnImg" runat="server" Value='<%# Bind("Resim") %>' />                                                    
                                                       <img src="" style="max-width: 150px; max-height: 150px;" id="sanalogFileImage" />
                                                       <a href="javascript:void(0)" class="btn btn-success btn-sm fileinput-button icon_yeni"  onclick="SnlgOpenSingleManager('<%=FVSyf.FindControl("HdnImg").ClientID %>');"><%= Resources.admin_language.article_add_image %></a>

                                                   
                                                    </div>

                                                </div>
                                                <div class="row form-group no-gutter">
                                                    <label class="col-md-4"><%= Resources.admin_language.active %></label>
                                                    <div class="col-md-8">
                                                        <asp:CheckBox ID="CBAktif" runat="server" Checked='<%# Bind("Aktif") %>' />
                                                    </div>
                                                </div>
                                                <div class="row form-group no-gutter">
                                                    <label class="col-md-4"><%= Resources.admin_language.article_cat_select %></label>
                                                    <div class="col-md-8">

                                                        <asp:DropDownList ID="DDLUst" CssClass="form-control" runat="server">
                                                        </asp:DropDownList>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>

                                        <div data-buttons="1" style="display: none">
                                            <asp:LinkButton ID="LinkButton4" CommandName="Insert" ValidationGroup="sekle" Text="<%$ Resources:admin_language, save %>" runat="server" alt="Ekle" class="btn btn-info icon_kaydet"></asp:LinkButton>
                                        </div>
                                    </InsertItemTemplate>
                                </asp:FormView>
                            </div>
                        </div>
                    </div>

                </div>

            </div>
        </div>
    </div>
    <asp:SqlDataSource ID="SDSSyf" runat="server" ConnectionString="<%$ ConnectionStrings:e_cobiConn %>"
        SelectCommand="snlg_V1.msp_ProjeKategoriDetaySec" SelectCommandType="StoredProcedure"
        InsertCommand="snlg_V1.msp_ProjeKategoriOlustur"
        InsertCommandType="StoredProcedure"
        OnInserting="SDSSyf_Inserting"
        OnInserted="SDSSyf_Inserted"
        OnSelected="SDSSyf_Selected"
        UpdateCommand="snlg_V1.msp_ProjeKategoriDuzenle"
        UpdateCommandType="StoredProcedure"
        OnUpdated="SDSSyf_Updated"
        OnUpdating="SDSSyf_Updating">
        <SelectParameters>
            <asp:QueryStringParameter Name="Dil" Type="Int16" QueryStringField="Dil" />
            <asp:QueryStringParameter Name="KtgId" Type="Int32" QueryStringField="kid" />
        </SelectParameters>
        <InsertParameters>
            <asp:Parameter Name="UstId" Type="String" />
            <asp:Parameter Name="KtgAd" Type="String" />
            <asp:Parameter Name="Sira" Type="Int16" />
            <asp:Parameter Name="Aktif" Type="Boolean" />
            <asp:Parameter Name="Resim" Type="String" />
            <asp:Parameter Name="SeoUrl" Type="String" />
            <asp:Parameter Name="Keyword" Type="String" />
            <asp:Parameter Name="Descr" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:QueryStringParameter Name="Dil" Type="Int16" QueryStringField="Dil" />
            <asp:QueryStringParameter Name="KtgId" Type="Int32" QueryStringField="kid" />
            <asp:Parameter Name="UstId" Type="Int32" />
            <asp:Parameter Name="KtgAd" Type="String" />
            <asp:Parameter Name="Sira" Type="Int16" />
            <asp:Parameter Name="Aktif" Type="Boolean" />
            <asp:Parameter Name="Resim" Type="String" />
            <asp:Parameter Name="SeoUrl" Type="String" />
            <asp:Parameter Name="Keyword" Type="String" />
            <asp:Parameter Name="Descr" Type="String" />
        </UpdateParameters>
    </asp:SqlDataSource>
</asp:Content>

