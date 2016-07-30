<%@ Page Language="C#" %>

<!DOCTYPE html>

<script runat="server">

</script>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <style>
        body {
            font: normal 12px Arial,Helvetica,Tahoma,Verdana,Sans-Serif;
            background-color: #FFFFFF;
        }

        select, input {
            font: normal 12px Arial,Helvetica,Tahoma,Verdana,Sans-Serif;
        }

        #embed {
            width: 100%;
            height: 110px;
            margin: 5px 0 0 0;
            border: 1px solid #a0a0a0;
            font: normal 11px Courier, Fixedsys, serif;
            color: #333;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div id="resim" style="width: 200px; height: 175px; float: left; margin-right: 20px;">
            <img src="../images/icon-image-gallery.jpg" alt="" />
        </div>
        <div id="icerik" style="float: left;">
            <div style="width: 175px; margin-bottom: 5px;">Galeri seçiniz:</div>
            <div>
                <asp:DropDownList ID="DDLGaleri" runat="server" DataSourceID="SdsGlr" DataTextField="GaleriAd"
                    DataValueField="GId">
                </asp:DropDownList>
            </div>
            <div style="height: 10px;">
            </div>
            <div style="width: 175px; margin-bottom: 5px;">Galeri tipi:</div>
            <div>
                <select id="RGType" name="RGType" size="1">
                    <option value="bootstrap-carousel">Bootstrap Carousel</option>
                    <option value="lightbox">LightBox Galeri</option>
                    <option value="zoom_gallery">Büyüteç Galeri</option>
                    
                </select>
            </div>
            <div style="height: 10px;">
            </div>
            <div style="width: 175px; margin-bottom: 5px;">Genişlik / Yükseklik:</div>
            <div>
                <input type="text" maxlength="4" id="RGGenislik" name="RGGenislik" />px
                / 
                <input type="text" maxlength="4" id="RGYukseklik" name="RGYukseklik" />px
            </div>
        </div>
        <asp:SqlDataSource ID="SdsGlr" runat="server" ConnectionString="<%$ ConnectionStrings:e_cobiConn %>"
            SelectCommand="SELECT [GId], [GaleriAd] FROM snlg_V1.TblResimGaleriApp ORDER BY [GaleriAd]"></asp:SqlDataSource>
    </form>
</body>
</html>
