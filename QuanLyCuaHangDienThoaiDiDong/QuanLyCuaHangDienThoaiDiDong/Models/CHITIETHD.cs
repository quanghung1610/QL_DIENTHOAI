//------------------------------------------------------------------------------
// <auto-generated>
//    This code was generated from a template.
//
//    Manual changes to this file may cause unexpected behavior in your application.
//    Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace QuanLyCuaHangDienThoaiDiDong.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class CHITIETHD
    {
        public int MAHD { get; set; }
        public int MASP { get; set; }
        public Nullable<int> SOLUONG { get; set; }
        public Nullable<decimal> DONGIA { get; set; }
        public Nullable<decimal> THANHTIEN { get; set; }
    
        public virtual HOADON HOADON { get; set; }
        public virtual SANPHAM SANPHAM { get; set; }
    }
}