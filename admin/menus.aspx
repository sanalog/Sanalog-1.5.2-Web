<%@ Page Title="" Language="C#" MasterPageFile="~/admin/MasterPage.master" AutoEventWireup="true" CodeFile="menus.aspx.cs" Inherits="admin_menus" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="Server">
    <script type="text/javascript">
        $(document).ready(function () {
            if ($("[data-buttons]").length > 0)
                $(".buttons:first div").html($(".buttons:first div").html() + $("[data-buttons]").html());

            $('[rel=haricilink]').hide();

            $('[rel=dahililink] select').change(function () {
                $('[rel=haricilink] input[type=text]').val($(this).val());
            });

            if ($("[rel=dahililink]  option[value='" + $('[rel=haricilink] input[type=text]').val() + "']").length > 0)
                $("[rel=dahililink]  option[value='" + $('[rel=haricilink] input[type=text]').val() + "']").attr('selected', 'selected')
            else {
                $('#linktipi option').eq(1).attr('selected', 'selected');
                $('[rel=dahililink]').hide();
                $('[rel=haricilink]').show();
            }

            $('#linktipi').change(function () {
                if ($(this).find('option:selected').val() == "dahililink") {
                    $('[rel=haricilink] input[type=text]').val($('[rel=dahililink] select').val());
                    $('[rel=dahililink]').show();
                    $('[rel=haricilink]').hide();
                }
                else {
                    $('[rel=haricilink] input[type=text]').val('http://www.');
                    $('[rel=dahililink]').hide();
                    $('[rel=haricilink]').show();
                }
            });


            $('body').on("click", ".icon_sil", function () {

                if ($('input[rel=Sec]:checked').length < 1) {
                    bootbox.alert('Herhangi bir seçim yapmadınız.');
                    return;
                }

                bootbox.confirm("Silmek istediğinizden emin misiniz?", function (result) {
                    if (result != true)
                        return;

                    $('#<%= BtnSil.ClientID %>')[0].click();
                });
            });


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

            <div class="page-head-x4"><%= Resources.admin_language.menus_title %></div>
            <div class="page-head-x1">
                <%= Resources.admin_language.menus_help %>
            </div>
            <div id="global_errors" class="errors-out">
                <div class="errors-in">
                </div>
            </div>

            <div class="row mb-md buttons" data-spy="affix" data-offset-top="150">
                <div class="col-md-12">
                    <a href="javascript:;" class="btn btn-danger icon_sil"><%= Resources.admin_language.menu_delete2 %></a>
                    <asp:LinkButton ID="BtnSil" runat="server" Style="display: none" OnClick="LKtgSil_Click"> </asp:LinkButton>

                </div>
            </div>

            <div class="panel">
                <div class="panel-heading"><%= Resources.admin_language.menus_group %></div>
                <div class="panel-body">
                    <asp:DropDownList runat="server" ID="DDLMenuGroup" CssClass="form-control" DataTextField="Title"
                        DataValueField="UCId" AutoPostBack="True" OnSelectedIndexChanged="DDLMenuGroup_SelectedIndexChanged">
                    </asp:DropDownList>
                </div>
            </div>

            <asp:Panel runat="server" ID="Pnl1">
                <div class="row">
                    <div class="col-md-3">

                        <div class="panel">
                            <div class="panel-heading"><%= Resources.admin_language.menus_your_menu %></div>
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
                                    <asp:FormView ID="FVSyf" runat="server" DataKeyNames="MenuId" DataSourceID="SDSSyf"
                                        DefaultMode="Edit" OnDataBound="FVSyf_DataBound">
                                        <EditItemTemplate>
                                            <div class="panel">
                                                <div class="col-md-12">
                                                    <div class="row form-group no-gutter flags ">
                                                        <label class="col-md-4"><%= Resources.admin_language.edit_lang %></label>
                                                        <div class="col-md-6"><%# DilleriListele(Eval("Diller")) %></div>

                                                    </div>
                                                    <div class="row form-group no-gutter">
                                                        <label class="col-md-4"><%= Resources.admin_language.menu_name %></label>
                                                        <div class="col-md-8">
                                                            <asp:TextBox ID="TBMenuItem" CssClass="form-control" runat="server" Text='<%# Bind("MenuItem") %>' MaxLength="200" />
                                                            <asp:RequiredFieldValidator ID="RFV5" runat="server" ControlToValidate="TBMenuItem" CssClass="hata"
                                                                Display="Dynamic" ErrorMessage="*" ValidationGroup="ekle" SetFocusOnError="true"></asp:RequiredFieldValidator>
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
                                                        <label class="col-md-4"><%= Resources.admin_language.connect_format %></label>
                                                        <div class="col-md-8">
                                                            <select id="linktipi" class="form-control">
                                                                <option value="dahililink" selected="selected"><%= Resources.admin_language.connect_format_in %></option>
                                                                <option value="haricilink"><%= Resources.admin_language.connect_format_out %></option>
                                                            </select>
                                                        </div>
                                                    </div>
                                                    <div class="row form-group no-gutter">
                                                        <label class="col-md-4"><%= Resources.admin_language.url_link %></label>
                                                        <div class="col-md-8">

                                                            <div class="dahili" rel="dahililink">


                                                                <asp:DropDownList ID="DDLLinks" CssClass="form-control" runat="server" DataTextField="LinkText"
                                                                    DataValueField="Link">
                                                                </asp:DropDownList>

                                                            </div>
                                                            <div class="harici" rel="haricilink">

                                                                <asp:TextBox ID="TBLink" CssClass="form-control" runat="server" MaxLength="210" Text='<%#Bind("MenuLink") %>' />

                                                            </div>

                                                        </div>
                                                    </div>
                                                    <div class="row form-group no-gutter">
                                                        <label class="col-md-4"><%= Resources.admin_language.target %></label>
                                                        <div class="col-md-8">
                                                            <asp:DropDownList ID="DDLHedef" CssClass="form-control" runat="server" SelectedValue='<%#Bind("Hedef") %>'>
                                                                <asp:ListItem Value="_self" runat="server" Text="<%$ Resources:admin_language, page_self %>" />
                                                                <asp:ListItem Value="_blank" runat="server" Text="<%$ Resources:admin_language, page_blank %>" />
                                                            </asp:DropDownList>
                                                        </div>
                                                    </div>
                                                    <div class="row form-group no-gutter">
                                                        <label class="col-md-4"><%= Resources.admin_language.active %></label>
                                                        <div class="col-md-8">
                                                            <asp:CheckBox ID="CBAktif" runat="server" Checked='<%# Bind("Aktif") %>' />
                                                        </div>
                                                    </div>
                                                    <div class="row form-group no-gutter">
                                                        <label class="col-md-4"><%= Resources.admin_language.menus_position %></label>
                                                        <div class="col-md-8">
                                                            <asp:DropDownList ID="DDLUst" CssClass="form-control" runat="server">
                                                            </asp:DropDownList>
                                                        </div>
                                                    </div>
                                                </div>

                                            </div>

                                            <div data-buttons="1" style="display: none">
                                                <asp:LinkButton ID="LinkButton1" CommandName="Update" ValidationGroup="ekle" runat="server" Text="<%$ Resources:admin_language, save %>"
                                                    class="btn btn-info icon_kaydet"></asp:LinkButton>
                                                <a href="menus.aspx?gid=<%= Request.QueryString["gid"] %>" class="btn btn-default icon_kapat"><%= Resources.admin_language.close %></a>
                                            </div>
                                        </EditItemTemplate>
                                        <InsertItemTemplate>
                                            <div class="panel">
                                                <div class="col-md-12">
                                                    <div class="row form-group no-gutter">
                                                        <label class="col-md-4"><%= Resources.admin_language.menu_name %></label>
                                                        <div class="col-md-8">
                                                            <asp:TextBox ID="TBMenuItem" CssClass="form-control" runat="server" Text='<%# Bind("MenuItem") %>' MaxLength="200" />
                                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="TBMenuItem" CssClass="hata"
                                                                Display="Dynamic" ErrorMessage="*" ValidationGroup="ekle" SetFocusOnError="true"></asp:RequiredFieldValidator>
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
                                                        <label class="col-md-4"><%= Resources.admin_language.connect_format %></label>
                                                        <div class="col-md-8">
                                                            <select id="linktipi" class="form-control">
                                                                <option value="dahililink" selected><%= Resources.admin_language.connect_format_in %></option>
                                                                <option value="haricilink"><%= Resources.admin_language.connect_format_out %></option>
                                                            </select>
                                                        </div>
                                                    </div>
                                                    <div class="row form-group no-gutter">
                                                        <label class="col-md-4"><%= Resources.admin_language.url_link %></label>
                                                        <div class="col-md-8">
                                                            <div class="dahili" rel="dahililink">
                                                                <asp:DropDownList ID="DDLLinks" CssClass="form-control" runat="server" DataTextField="LinkText" DataValueField="Link">
                                                                </asp:DropDownList>

                                                            </div>
                                                            <div class="harici" rel="haricilink">

                                                                <asp:TextBox ID="TBLink" CssClass="form-control" runat="server" MaxLength="210" Text='<%#Bind("MenuLink") %>' />

                                                            </div>

                                                        </div>
                                                    </div>
                                                    <div class="row form-group no-gutter">
                                                        <label class="col-md-4"><%= Resources.admin_language.target %></label>
                                                        <div class="col-md-8">
                                                            <asp:DropDownList ID="DDLHedef" CssClass="form-control" runat="server" SelectedValue='<%#Bind("Hedef") %>'>
                                                                <asp:ListItem Value="_self" runat="server" Text="<%$ Resources:admin_language, page_self %>" />
                                                                <asp:ListItem Value="_blank" runat="server" Text="<%$ Resources:admin_language, page_blank %>" />
                                                            </asp:DropDownList>
                                                        </div>
                                                    </div>
                                                    <div class="row form-group no-gutter">
                                                        <label class="col-md-4"><%= Resources.admin_language.active %></label>
                                                        <div class="col-md-8">
                                                            <asp:CheckBox ID="CBAktif" runat="server" Checked='<%# Bind("Aktif") %>' />
                                                        </div>
                                                    </div>
                                                    <div class="row form-group no-gutter">
                                                        <label class="col-md-4"><%= Resources.admin_language.menus_position %></label>
                                                        <div class="col-md-8">
                                                            <asp:DropDownList ID="DDLUst" CssClass="form-control" runat="server">
                                                            </asp:DropDownList>
                                                        </div>
                                                    </div>
                                                </div>

                                            </div>

                                            <div data-buttons="1" style="display: none">
                                                <asp:LinkButton ID="LinkButton4" CommandName="Insert" ValidationGroup="ekle" runat="server" class="btn btn-info icon_kaydet"> <%= Resources.admin_language.save %></asp:LinkButton>
                                            </div>
                                        </InsertItemTemplate>
                                    </asp:FormView>
                                </div>
                            </div>
                        </div>

                    </div>

                </div>
            </asp:Panel>
        </div>
    </div>
    <asp:SqlDataSource ID="SDSSyf" runat="server" ConnectionString="<%$ ConnectionStrings:e_cobiConn %>"
        SelectCommand="snlg_V1.msp_MenuKategoriDetaySec" SelectCommandType="StoredProcedure"
        InsertCommand="snlg_V1.msp_MenuKategoriOlustur"
        InsertCommandType="StoredProcedure"
        OnInserting="SDSSyf_Inserting"
        OnInserted="SDSSyf_Inserted"
        OnSelected="SDSSyf_Selected"
        UpdateCommand="snlg_V1.msp_MenuKategoriDuzenle"
        UpdateCommandType="StoredProcedure"
        OnUpdated="SDSSyf_Updated"
        OnUpdating="SDSSyf_Updating">
        <SelectParameters>
            <asp:QueryStringParameter Name="Dil" Type="Int16" QueryStringField="Dil" />
            <asp:QueryStringParameter Name="MenuId" Type="Int32" QueryStringField="mid" />
        </SelectParameters>
        <InsertParameters>
            <asp:Parameter Name="UstId" Type="Int32" />
            <asp:Parameter Name="MenuItem" Type="String" />
            <asp:Parameter Name="Aktif" Type="Boolean" />
            <asp:Parameter Name="Resim" Type="String" />
            <asp:Parameter Name="MenuLink" Type="String" />
            <asp:Parameter Name="Hedef" Type="String" />
            <asp:QueryStringParameter Name="UCId" Type="Int32" QueryStringField="gid" />
        </InsertParameters>
        <UpdateParameters>
            <asp:QueryStringParameter Name="Dil" Type="Int16" QueryStringField="Dil" />
            <asp:QueryStringParameter Name="MenuId" Type="Int32" QueryStringField="mid" />
            <asp:Parameter Name="UstId" Type="Int32" />
            <asp:Parameter Name="MenuItem" Type="String" />
            <asp:Parameter Name="Aktif" Type="Boolean" />
            <asp:Parameter Name="Resim" Type="String" />
            <asp:Parameter Name="MenuLink" Type="String" />
            <asp:Parameter Name="Hedef" Type="String" />
        </UpdateParameters>
    </asp:SqlDataSource>

</asp:Content>

