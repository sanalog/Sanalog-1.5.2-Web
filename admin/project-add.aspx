<%@ Page Title="" Language="C#" MasterPageFile="~/admin/MasterPage.master" AutoEventWireup="true"
    CodeFile="~/admin/project-add.aspx.cs" Inherits="admin_projeekle" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="Server">
    <script type="text/javascript">
        $(document).ready(function () {

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

            //kaydettikten sonra yeni sayfa açmak için
            $('.icon_kaydetyeniac').click(function () {
                $('[name=HdnYeni]').val('1');
            });

            $('textarea[limit]').keyup(function (e) {
                var limit = $(this).attr('limit');
                if ($(this).val().length >= limit) {
                    if (e.keyCode != 8 && e.keyCode != 46)
                        e.preventDefault();
                    $(this).val($(this).val().substring(0, limit));
                }
                $('#' + $(this).attr('span')).text(limit - $(this).val().length);
            }).keydown(function (e) {
                var limit = $(this).attr('limit');
                if ($(this).val().length >= limit) {
                    if (e.keyCode != 8 && e.keyCode != 46)
                        e.preventDefault();
                    $(this).val($(this).val().substring(0, limit));
                }
                $('#' + $(this).attr('span')).text(limit - $(this).val().length);
            });
        });
    </script>



</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="CPH1" runat="Server">
    <input type="hidden" name="HdnYeni" />
    <cc1:ToolkitScriptManager ID="TSM1" runat="server" EnableScriptGlobalization="True">
    </cc1:ToolkitScriptManager>
    <div class="row projeEkle">
        <div class="col-md-12">

            <asp:FormView ID="FVIcerik" runat="server" DataKeyNames="ProjeId" DataSourceID="SDSPrj"
                DefaultMode="Edit" OnDataBound="FVIcerik_DataBound">
                <InsertItemTemplate>
                    <div class="page-head-x4"><%= Resources.admin_language.project_add_title %></div>
                    <div class="page-head-x1"><%= Resources.admin_language.project_add_help %></div>

                    <div class="row mb-md buttons" data-spy="affix" data-offset-top="150">
                        <div class="col-md-12">
                            <asp:LinkButton CommandName="Insert" ValidationGroup="makekle" runat="server" Text="<%$ Resources:admin_language, save %>" class="btn btn-info icon_kaydet"></asp:LinkButton>
                            <a href="projects.aspx" class="btn btn-default icon_kapat"><%= Resources.admin_language.close %></a>

                        </div>
                    </div>

                    <div id="global_errors" class="errors-out">
                        <div class="errors-in"></div>
                    </div>

                    <div class="panel">
                        <div class="panel-heading"><%= Resources.admin_language.project_add %></div>
                        <div class="panel-body">
                            <div class="row form-group no-gutter">
                                <label class="col-md-6"><%= Resources.admin_language.project_name %></label>
                                <div class="col-md-6">
                                    <asp:TextBox ID="TBBaslik" CssClass="form-control" runat="server" Text='<%# Bind("Baslik") %>' MaxLength="250" />
                                    <asp:RequiredFieldValidator runat="server" ControlToValidate="TBBaslik"
                                        CssClass="hata" Display="Dynamic" ErrorMessage="*" ValidationGroup="makekle"
                                        SetFocusOnError="true"></asp:RequiredFieldValidator>
                                </div>
                            </div>

                            <div class="row form-group no-gutter">
                                <label class="col-md-6"><%= Resources.admin_language.project_home_page %></label>
                                <div class="col-md-6">
                                    <asp:TextBox ID="TBLink" CssClass="form-control" runat="server" MaxLength="210" Text='<%# Bind("ProjeUrl") %>' />
                                </div>
                            </div>

                            <div class="row form-group no-gutter">
                                <label class="col-md-6"><%= Resources.admin_language.article_add_img %></label>
                                <div class="col-md-6">
                                    <p>
                                         <asp:HiddenField ID="HdnImg" runat="server" Value='<%# Bind("Resim") %>' />                                                    
                                         <img src="" style="max-width: 150px; max-height: 150px;" id="sanalogFileImage" /> 
                                         <a href="javascript:void(0)" class="btn btn-success btn-sm fileinput-button icon_yeni"  onclick="SnlgOpenSingleManager('<%=FVIcerik.FindControl("HdnImg").ClientID %>');"><%= Resources.admin_language.article_add_image %></a>
                                    </p>
                                </div>
                            </div>

                            <div class="row form-group no-gutter">
                                <label class="col-md-6"><%= Resources.admin_language.article_add_small_content %></label>
                                <div class="col-md-6">
                                    <asp:TextBox ID="TBBilgi" CssClass="form-control" runat="server" Text='<%# Bind("Bilgi") %>' Height="90px"
                                        TextMode="MultiLine" limit="750" span="TBilgiSay" />
                                    <br />
                                    <span class="spanlimit" id="TBilgiSay" />
                                </div>
                            </div>

                            <div class="row form-group no-gutter">
                                <label class="col-md-6"><%= Resources.admin_language.project_cat %></label>
                                <div class="col-md-6">
                                    <asp:ListBox ID="ListKtg" CssClass="form-control list long" runat="server" Rows="8" SelectionMode="Multiple"></asp:ListBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="ListKtg"
                                        CssClass="hata" Display="Dynamic" ErrorMessage="*" ValidationGroup="makekle"
                                        SetFocusOnError="true"></asp:RequiredFieldValidator>
                                </div>
                            </div>

                            <div class="row form-group no-gutter">
                                <label class="col-md-6"><%= Resources.admin_language.article_add_row %></label>
                                <div class="col-md-6">
                                    <asp:TextBox ID="TbSira" CssClass="form-control" runat="server" Text='<%# Bind("Sira") %>' MaxLength="5" />
                                    <asp:RangeValidator runat="server" ControlToValidate="TBSira" CssClass="hata"
                                        Display="Dynamic" ErrorMessage="<%$ Resources:admin_language,products_error %>" MaximumValue="255"
                                        MinimumValue="0" Type="Integer" ValidationGroup="makekle" SetFocusOnError="true"></asp:RangeValidator>
                                </div>
                            </div>
                            <div class="row form-group-no-border no-gutter">
                                <label class="col-md-6"><%= Resources.admin_language.active %></label>
                                <div class="col-md-6">
                                    <asp:CheckBox ID="CB" Text="" runat="server" Checked='<%# Bind("Aktif") %>' />
                                </div>
                            </div>

                        </div>
                    </div>

                </InsertItemTemplate>
                <EditItemTemplate>
                    <div class="page-head-x4"><%= Resources.admin_language.project_edit_title %></div>
                    <div class="page-head-x1"><%= Resources.admin_language.project_edit_help %></div>

                    <div class="row mb-md buttons" data-spy="affix" data-offset-top="150">
                        <div class="col-md-12">
                            <asp:LinkButton CommandName="Update" ValidationGroup="makekle" runat="server" Text="<%$ Resources:admin_language, save %>" class="btn btn-info icon_kaydet"> </asp:LinkButton>
                            <asp:LinkButton CommandName="Update" ValidationGroup="makekle" runat="server" Text="<%$ Resources:admin_language, save_new %>" class="btn btn-success icon_kaydetyeniac"></asp:LinkButton>
                            <asp:LinkButton CommandName="delete" runat="server" Text="<%$ Resources:admin_language, delete %>" class="btn btn-danger icon_sil" Visible='<%# Request.QueryString["dil"] != Snlg_ConfigValues.defaultLangId  %>' data-bb="confirm" data-confirm-text="<%$ Resources:admin_language, delete_onay %>"></asp:LinkButton>
                            <a href="projects.aspx" class="btn btn-default icon_kapat"><%= Resources.admin_language.close %></a>

                        </div>
                    </div>

                    <div id="global_errors" class="errors-out">
                        <div class="errors-in"></div>
                    </div>
                    <div class="panel">
                        <div class="panel-heading"><%= Resources.admin_language.project_edit %></div>
                        <div class="panel-body">



                            <div class="row form-group no-gutter">
                                <label class="col-md-6"><%= Resources.admin_language.edit_lang %></label>
                                <div class="col-md-6">
                                    <%# DilleriListele(Eval("Diller")) %>
                                </div>
                            </div>

                            <div class="row form-group no-gutter">
                                <label class="col-md-6"><%= Resources.admin_language.project_name %></label>
                                <div class="col-md-6">
                                    <asp:TextBox ID="TBBaslik" CssClass="form-control" runat="server" Text='<%# Bind("Baslik") %>' MaxLength="500" />
                                    <asp:RequiredFieldValidator runat="server" ControlToValidate="TBBaslik"
                                        CssClass="hata" Display="Dynamic" ErrorMessage="*" ValidationGroup="makekle"
                                        SetFocusOnError="true"></asp:RequiredFieldValidator>
                                </div>
                            </div>
                            <div class="row form-group no-gutter">
                                <label class="col-md-6"><%= Resources.admin_language.project_home_pages %></label>
                                <div class="col-md-6">
                                    <select id="linktipi" class="form-control form-control-inline">
                                        <option value="dahililink" selected="selected"><%= Resources.admin_language.connect_format_in %></option>
                                        <option value="haricilink"><%= Resources.admin_language.connect_format_out %></option>
                                    </select>
                                    <div rel="dahililink" style="float: left;">
                                        <asp:DropDownList ID="DDLLinks" CssClass="form-control form-control-inline" runat="server" DataTextField="PLink" DataValueField="SeoUrl" DataSourceID="SDS">
                                        </asp:DropDownList>
                                    </div>
                                    <div rel="haricilink" style="float: left;">
                                        <asp:TextBox ID="TBLink" CssClass="form-control form-control-inline" runat="server" MaxLength="210" Text='<%# Bind("ProjeUrl") %>' />
                                    </div>
                                </div>
                            </div>

                            <div class="row form-group no-gutter">
                                <label class="col-md-6"><%= Resources.admin_language.article_add_img %></label>
                                <div class="col-md-6">
                                    <p>
                                        <asp:HiddenField ID="HdnImg" runat="server" Value='<%# Bind("Resim") %>' />
                                        <img src='<%# Eval("Resim") %>' style="max-width: 150px; max-height: 150px;" id="sanalogFileImage" />
                                        <a href="javascript:void(0)" class="btn btn-success btn-sm fileinput-button icon_yeni"  onclick="SnlgOpenSingleManager('<%=FVIcerik.FindControl("HdnImg").ClientID %>');"><%= Resources.admin_language.article_add_image %></a>
                                    </p>
                                    <p>
                                        <asp:LinkButton ID="LinkRSil" runat="server" CssClass="btn btn-danger btn-sm" Text="<%$ Resources:admin_language, activity_image_delete %>" Visible='<%# !string.IsNullOrEmpty(Eval("Resim").ToString()) %>'
                                            OnClick="LinkRSil_Click"></asp:LinkButton>
                                    </p>
                                </div>
                            </div>

                            <div class="row form-group no-gutter">
                                <label class="col-md-6"><%= Resources.admin_language.article_add_small_content %></label>
                                <div class="col-md-6">
                                    <asp:TextBox ID="TBBilgi" CssClass="form-control" runat="server" Text='<%# Bind("Bilgi") %>' Height="90px"
                                        TextMode="MultiLine" limit="750" span="TBilgiSay" />
                                    <br />
                                    <span class="spanlimit" id="TBilgiSay" />
                                </div>
                            </div>

                            <div class="row form-group no-gutter">
                                <label class="col-md-6"><%= Resources.admin_language.project_cat %></label>
                                <div class="col-md-6">
                                    <asp:ListBox ID="ListKtg" CssClass="form-control list long" runat="server" Rows="8" SelectionMode="Multiple"></asp:ListBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="ListKtg"
                                        CssClass="hata" Display="Dynamic" ErrorMessage="*" ValidationGroup="makekle"
                                        SetFocusOnError="true"></asp:RequiredFieldValidator>

                                </div>
                            </div>

                            <div class="row form-group no-gutter">
                                <label class="col-md-6"><%= Resources.admin_language.article_add_row %></label>
                                <div class="col-md-6">
                                    <asp:TextBox ID="TbSira" CssClass="form-control" runat="server" Text='<%# Bind("Sira") %>' MaxLength="5" />
                                    <asp:RangeValidator runat="server" ControlToValidate="TBSira" CssClass="hata"
                                        Display="Dynamic" ErrorMessage="<%$ Resources:admin_language,products_error %>" MaximumValue="255"
                                        MinimumValue="0" Type="Integer" ValidationGroup="makekle" SetFocusOnError="true"></asp:RangeValidator>
                                </div>
                            </div>

                            <div class="row form-group no-gutter">
                                <label class="col-md-6"><%= Resources.admin_language.active %></label>
                                <div class="col-md-6">
                                    <asp:CheckBox ID="CB" Text="" runat="server" Checked='<%# Bind("Aktif") %>' />
                                </div>
                            </div>

                        </div>

                    </div>

                </EditItemTemplate>


            </asp:FormView>


        </div>

    </div>

    <asp:SqlDataSource ID="SDS" runat="server" ConnectionString="<%$ ConnectionStrings:e_cobiConn %>"
        SelectCommand="SELECT TPABD.SeoUrl AS PLink, TPABD.SeoUrl AS SeoUrl FROM snlg_V1.TblProjeAltBilgiApp AS TPAB 
INNER JOIN snlg_V1.TblProjeAltBilgiDetay AS TPABD ON
TPAB.ProjeAltId=TPABD.ProjeAltId AND TPAB.ProjeId=@ProjeId AND TPABD.Dil=@Dil WHERE TPABD.SeoUrl IS NOT NULL">
        <SelectParameters>
            <asp:QueryStringParameter Name="ProjeId" QueryStringField="projeid" Type="Int32" />
            <asp:QueryStringParameter Name="Dil" QueryStringField="dil" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>

    <asp:SqlDataSource ID="SDSPrj" runat="server" ConnectionString="<%$ ConnectionStrings:e_cobiConn %>"
        InsertCommand="snlg_V1.msp_ProjeEkle" InsertCommandType="StoredProcedure" SelectCommand="snlg_V1.msp_ProjeDetaySec"
        SelectCommandType="StoredProcedure" OnInserted="SDSPrj_Inserted" UpdateCommand="snlg_V1.msp_ProjeDuzenle"
        UpdateCommandType="StoredProcedure" OnUpdated="SDSPrj_Updated" OnInserting="SDSPrj_Inserting"
        OnUpdating="SDSPrj_Updating" DeleteCommand="DELETE FROM snlg_V1.TblProjeDetay FROM snlg_V1.TblProjeDetay INNER JOIN snlg_V1.TblProjeApp ON snlg_V1.TblProjeDetay.ProjeId = snlg_V1.TblProjeApp.ProjeId WHERE (snlg_V1.TblProjeApp.ProjeId = @ProjeId) AND (snlg_V1.TblProjeDetay.Dil = @Dil)"
        OnDeleted="SDSPrj_Deleted" OnDeleting="SDSPrj_Deleting">
        <DeleteParameters>
            <asp:QueryStringParameter Name="Dil" Type="Int16" QueryStringField="dil" />
            <asp:QueryStringParameter Name="ProjeId" QueryStringField="ProjeId" />

        </DeleteParameters>
        <SelectParameters>

            <asp:QueryStringParameter Name="Dil" Type="Int16" QueryStringField="dil" />
            <asp:QueryStringParameter Name="ProjeId" QueryStringField="projeid" Type="Int32" />
        </SelectParameters>
        <UpdateParameters>

            <asp:QueryStringParameter Name="ProjeId" QueryStringField="projeid" Type="Int32" />
            <asp:QueryStringParameter Name="Dil" Type="Int16" QueryStringField="dil" />
            <asp:Parameter Name="KtgSql" Type="String" />
            <asp:Parameter Name="Sira" Type="Byte" />
            <asp:Parameter Name="Aktif" Type="Boolean" />
            <asp:Parameter Name="Baslik" Type="String" />
            <asp:Parameter Name="Bilgi" Type="String" />
            <asp:Parameter Name="Resim" Type="String" />
            <asp:Parameter Name="ProjeUrl" Type="String" />
        </UpdateParameters>
        <InsertParameters>

            <asp:Parameter Name="KtgSql" Type="String" />
            <asp:Parameter Name="Sira" Type="Byte" />
            <asp:Parameter Name="Aktif" Type="Boolean" />
            <asp:Parameter Name="Baslik" Type="String" />
            <asp:Parameter Name="Bilgi" Type="String" />
            <asp:Parameter Name="Resim" Type="String" />
            <asp:Parameter Name="ProjeUrl" Type="String" />
        </InsertParameters>
    </asp:SqlDataSource>
</asp:Content>
