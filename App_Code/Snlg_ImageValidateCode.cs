using System;
using System.Drawing;
using System.Drawing.Drawing2D;
using System.Drawing.Imaging;
using System.Drawing.Text;

public class Snlg_ImageValidateCode
{
    public Bitmap Image;
    private string text;
    private Random random = new Random();

    public Snlg_ImageValidateCode(int genislik, int yukseklik, byte uzunluk)
    {
        this.text = RastgeleKodUretici(uzunluk);
        System.Web.HttpContext.Current.Session["validText"] = this.text;
        this.ResimOlustur(genislik, yukseklik);
    }

    private void ResimOlustur(int genislik, int yukseklik)
    {
        Bitmap bitmap = new Bitmap(genislik, yukseklik, PixelFormat.Format32bppArgb);

        Graphics g = Graphics.FromImage(bitmap);
        g.SmoothingMode = SmoothingMode.AntiAlias;
        Rectangle rect = new Rectangle(0, 0, genislik, yukseklik);

        HatchBrush hatchBrush = new HatchBrush(HatchStyle.SmallConfetti, Color.LightGray, Color.White);
        g.FillRectangle(hatchBrush, rect);

        SizeF size;
        float fontSize = rect.Height + 1;
        Font font;

        do
        {
            fontSize--;
            font = new Font(System.Drawing.FontFamily.GenericSerif.Name, fontSize, FontStyle.Bold);
            size = g.MeasureString(this.text, font);
        } while (size.Width > rect.Width);

        StringFormat format = new StringFormat();
        format.Alignment = StringAlignment.Center;
        format.LineAlignment = StringAlignment.Center;

        GraphicsPath path = new GraphicsPath();
        path.AddString(this.text, font.FontFamily, (int)font.Style, font.Size, rect, format);
        float v = 4F;
        PointF[] points =
   {
    new PointF(this.random.Next(rect.Width) / v, this.random.Next(rect.Height) / v),
    new PointF(rect.Width - this.random.Next(rect.Width) / v, this.random.Next(rect.Height) / v),
    new PointF(this.random.Next(rect.Width) / v, rect.Height - this.random.Next(rect.Height) / v),
    new PointF(rect.Width - this.random.Next(rect.Width) / v, rect.Height - this.random.Next(rect.Height) / v)
   };
        Matrix matrix = new Matrix();
        matrix.Translate(0F, 0F);
        path.Warp(points, rect, matrix, WarpMode.Perspective, 0F);

        hatchBrush = new HatchBrush(HatchStyle.LargeConfetti, Color.LightGray, Color.DarkGray);
        g.FillPath(hatchBrush, path);

        int m = Math.Max(rect.Width, rect.Height);
        for (int i = 0; i < (int)(rect.Width * rect.Height / 30F); i++)
        {
            int x = this.random.Next(rect.Width);
            int y = this.random.Next(rect.Height);
            int w = this.random.Next(m / 50);
            int h = this.random.Next(m / 50);
            g.FillEllipse(hatchBrush, x, y, w, h);
        }

        font.Dispose();
        hatchBrush.Dispose();
        g.Dispose();

        this.Image = bitmap;
    }

    public static string RastgeleKodUretici(byte uzunluk)
    {
        Random rnd = new Random();
        string karkaterler = "1234567890";
        string kod = "";
        for (byte i = 0; i < uzunluk; i++)
            kod += karkaterler[rnd.Next(0, karkaterler.Length - 1)];

        return kod;
    }

    ~Snlg_ImageValidateCode()
    {
        Dispose(false);
    }

    public void Dispose()
    {
        GC.SuppressFinalize(this);
        this.Dispose(true);
    }

    protected virtual void Dispose(bool disposing)
    {
        if (disposing)
            this.Image.Dispose();
    }
}










