<%@ Page Title="" Language="C#" MasterPageFile="~/admin/MasterPage.master" AutoEventWireup="true"
    CodeFile="members.aspx.cs" Inherits="admin_uyeler" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="Server">
    <script type="text/javascript">
        $(document).ready(function () {
            $('table tr').click(function (e) {
                if (e.target.tagName == "TD") {
                    $("input[rel=Sec]").prop('checked', false);
                    $(this).closest('tr').find('input[rel=Sec]').prop('checked', 'checked');
                    $('.icon_duzenle').click();
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

                    $('[name=HdnSil]').val('');
                    $('input[rel=Sec]:checked').each(function () {
                        $('[name=HdnSil]').val($('[name=HdnSil]').val() + $(this).val() + ',');
                    });
                    $('[name=HdnSil]').val($('[name=HdnSil]').val().substring(0, $('[name=HdnSil]').val().length - 1));
                    $('form').submit();
                });
            });

            $('body').on("change", "input[rel=TSec]", function () {
                $("input[rel=Sec]").prop('checked', $(this).is(':checked'));
            });

            $('body').on("click", ".icon_duzenle", function () {
                if ($('input[rel=Sec]:checked').length > 1)
                    bootbox.alert('Birden fazla seçim yaptınız. Lütfen 1 adet seçim yapınız.');
                else if ($('input[rel=Sec]:checked').length == 0)
                    bootbox.alert('Herhangi bir seçim yapmadınız.');
                else
                    window.location.href = "member-detail.aspx?dil=<%= Snlg_ConfigValues.defaultLangId %>&uid=" + $('input[rel=Sec]:checked:first').val();
            });
        });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="CPH1" runat="Server">
    <input type="hidden" name="HdnSil" />
    <cc1:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server">
    </cc1:ToolkitScriptManager>
    <script type="text/javascript" language="javascript">
        Sys.WebForms.PageRequestManager.getInstance().add_endRequest(EndRequestHandler);
        function EndRequestHandler(sender, args) {
            $('.errors-in > div').remove();
            if (document.getElementById('<%= HdnHata.ClientID %>').value != "") {
                var hata = document.getElementById('<%= HdnHata.ClientID %>').value;
                var hataTur = document.getElementById('<%= HdnHataTur.ClientID %>').value;
                $('.errors-out').css('display', 'block');
                $('.errors-in').append('<div class="' + hataTur + '">' + hata + '</div>');
                document.getElementById('<%= HdnHata.ClientID %>').value = "";
                document.getElementById('<%= HdnHataTur.ClientID %>').value = "";
            }
        }
    </script>
    <div class="row uyeler">
        <div class="col-md-12">


            <div class="page-head-x4"><%= Resources.admin_language.members_title %></div>
      <div class="page-head-x1"><%= Resources.admin_language.members_help %></div>




       <asp:UpdatePanel runat="server">
            <ContentTemplate>
                <asp:HiddenField ID="HdnHata" runat="server" />
                <asp:HiddenField ID="HdnHataTur" runat="server" />


             <div class="row mb-md buttons" data-spy="affix" data-offset-top="150">
        <div class="col-md-12">

<a href="javascript:;" class="btn btn-info icon_duzenle"> <%= Resources.admin_language.edit %></a>
<a href="javascript:;" class="btn btn-danger icon_sil"> <%= Resources.admin_language.delete %></a>
<a href="member-detail.aspx" class="btn btn-success icon_yeni"> <%= Resources.admin_language.members_new %></a>

        </div>
      </div>
                    
         

        <div id="global_errors" class="errors-out">
            <div class="errors-in">
            </div>
        </div>




  <div class="panel">
            <div class="panel-heading"><%= Resources.admin_language.members_list %></div>
            <div class="panel-body">  

                <div class="row mb-md no-gutter">
        <div class="col-md-12">
<label><%= Resources.admin_language.members_select_group %></label>
 <asp:DropDownList ID="DDLRol" CssClass="form-control" runat="server" AppendDataBoundItems="True" AutoPostBack="True"
                        DataSourceID="SDSRol" DataTextField="RolAd" DataValueField="RolId">
                        <asp:ListItem Text="<%$ Resources:admin_language, members_all_users %>" Value="" />
                    </asp:DropDownList>
        </div>

                </div>

             <hr />
                    <asp:GridView ID="GVUye" class="table table-bordered table-striped" runat="server" AutoGenerateColumns="False" DataSourceID="SDSUye"
                        AllowPaging="True" PageSize="10" AllowSorting="True" DataKeyNames="UyeId" OnDataBound="GVUye_DataBound">
                        <Columns>
                            <asp:TemplateField ItemStyle-CssClass="secim" HeaderStyle-CssClass="secim">
                                <HeaderTemplate>
                                    <input rel="TSec" type="checkbox" runat="server" title="<%$ Resources:admin_language, members_all_users %>" />
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <input rel="Sec" type="checkbox" value="<%# Eval("UyeId") %>" />
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField DataField="UserName" runat="server" HeaderText="<%$ Resources:admin_language, user_name %>" SortExpression="UserName"
                                HeaderStyle-CssClass="isim" ItemStyle-CssClass="isim" />
                            <asp:BoundField DataField="Eposta" runat="server" HeaderText="<%$ Resources:admin_language, mail %>"  SortExpression="Eposta" HeaderStyle-CssClass="e-posta" ItemStyle-CssClass="e-posta" />
                            <asp:TemplateField  runat="server" HeaderText="<%$ Resources:admin_language, active %>"  SortExpression="Aktif" ItemStyle-CssClass="aktif"
                                HeaderStyle-CssClass="aktif">
                                <ItemTemplate>
                                    <input type="checkbox" value="" checked="<%# Convert.ToBoolean(Eval("Aktif")) ? "checked": "" %>"
                                        disabled="disabled" />
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                                <PagerTemplate>
                                    <nav>
                                        <ul class="pagination" >
                                            <li><asp:LinkButton runat="server" ID="IlkPage" CommandName="First" aria-hidden="true" >&laquo;</asp:LinkButton></li>
                                            <li><asp:LinkButton runat="server" ID="geri" CommandName="Prev"   aria-hidden="true" >&#8249;</asp:LinkButton> </li>
                                            <asp:PlaceHolder ID="Sayfalama" runat="server" />
                                            <li><asp:LinkButton runat="server" ID="ileri"  CommandName="Next" aria-hidden="true" >&#8250;</asp:LinkButton></li>
                                            <li><asp:LinkButton runat="server" ID="SonPage" CommandName="Last"   aria-hidden="true" >&raquo;</asp:LinkButton></li>
                                        </ul>
                                  </nav>
                                </PagerTemplate>
                        <RowStyle CssClass="satir" />
                        <AlternatingRowStyle CssClass="aSatir" />
                        <EditRowStyle CssClass="eSatir" />
                        <SelectedRowStyle CssClass="seciliSatir" />
                        
                        <HeaderStyle CssClass="baslikSatir" />
                        <SortedAscendingHeaderStyle CssClass="artan" />
                        <SortedDescendingHeaderStyle CssClass="azalan" />
                        <SortedAscendingCellStyle CssClass="artan" />
                        <SortedDescendingCellStyle CssClass="azalan" />
                    </asp:GridView>
        
                <asp:SqlDataSource ID="SDSUye" runat="server" ConnectionString="<%$ ConnectionStrings:e_cobiConn %>"
                    SelectCommand="snlg_V1.msp_Uyeler" SelectCommandType="StoredProcedure" CancelSelectOnNullParameter="False">
                    <SelectParameters>
                        
                        <asp:ControlParameter ControlID="DDLRol" Name="RolId" PropertyName="SelectedValue"
                            Type="Int16" />
                    </SelectParameters>
                </asp:SqlDataSource>
                <asp:SqlDataSource ID="SDSRol" runat="server" ConnectionString="<%$ ConnectionStrings:e_cobiConn %>"
                    SelectCommand="SELECT RolId, RolAd FROM snlg_V1.TblRoller  ORDER BY RolAd">
                    <SelectParameters>
                        
                    </SelectParameters>
                </asp:SqlDataSource>
       

</div>
    </div>    


            </ContentTemplate>
        </asp:UpdatePanel>

    </div>
    </div>
</asp:Content>
