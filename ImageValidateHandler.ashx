<%@ WebHandler Language="C#" Class="DogrulamaHandler" %>

using System;
using System.Web;

public class DogrulamaHandler : IHttpHandler, System.Web.SessionState.IRequiresSessionState
{
    public void ProcessRequest(HttpContext context)
    {
        Snlg_ImageValidateCode ci = new Snlg_ImageValidateCode(Convert.ToInt32(HttpContext.Current.Request.QueryString["g"]), Convert.ToInt32(HttpContext.Current.Request.QueryString["y"]), Convert.ToByte(HttpContext.Current.Request.QueryString["u"]));
        context.Response.Clear();
        context.Response.ContentType = "image/jpeg";
        ci.Image.Save(context.Response.OutputStream, System.Drawing.Imaging.ImageFormat.Jpeg);
        ci.Dispose();
    }

    public bool IsReusable { get { return false; } }

}