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
    
    public partial class PHANQUYEN
    {
        public int ID { get; set; }
        public Nullable<int> MANV { get; set; }
        public Nullable<bool> QL_DONHANG { get; set; }
        public Nullable<bool> QL_SANPHAM { get; set; }
        public Nullable<bool> QL_KHACHHANG { get; set; }
        public Nullable<bool> QL_NHACC { get; set; }
        public Nullable<bool> QL_NHAPHANG { get; set; }
        public Nullable<bool> THONGKE { get; set; }
    
        public virtual NHANVIEN NHANVIEN { get; set; }
    }
}
