<%@ Control Language="C#" AutoEventWireup="true" CodeFile="member-panel.ascx.cs" Inherits="modules_uyelik_uye_paneli" %>


<p><strong><%=GetGlobalResourceObject("default", "uye_hosgeldiniz_hosgeldin").ToString() %></strong></p>
<div class="form-group">

    
</div>
<div class="row">
    <div class="col-sm-4"><asp:Image ID="ImgRes" runat="server" CssClass="img-responsive"/></div>
    <div class="col-sm-8">
<p><asp:Literal runat="server" ID="LtrUyeAdi"></asp:Literal></p>
        <a class="btn btn-default btn-sm" href='<%= "/" + Snlg_ConfigValues.s_Dil + "/" + Snlg_ConfigValues.GetUrlValueByKey("user") + "/" + Snlg_MemberInfo.s_UserUrl + Snlg_ConfigValues.urlExtension %>'><%=GetGlobalResourceObject("default", "uye_hosgeldiniz_bilgi").ToString() %></a>
        <asp:LinkButton Text="Çıkış" CssClass="btn btn-default btn-sm" runat="server" OnClick="Logout_Click" />
    </div>
</div>
    





