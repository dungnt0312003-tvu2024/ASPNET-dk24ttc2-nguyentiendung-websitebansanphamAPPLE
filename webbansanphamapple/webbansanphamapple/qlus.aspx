<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="qlus.aspx.cs" Inherits="webbansanphamapple.QLUser" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <form runat="server">
        <div class="d-flex">
            <!-- Sidebar -->
            <div class="sidebar">
                <h4 class="text-white text-center py-3">ADMIN</h4>
                <a href="default.aspx">Trang chủ</a>
                <a href="qlus.aspx" class="text-success">Quản lí người dùng</a>
                <a href="qlsp.aspx">Quản lí sản phẩm</a>
                <asp:Label runat="server" ID="lblXinchao" class="text-light"></asp:Label>
                <asp:Button runat="server" Text="Đăng Xuất" OnClick="log_out" class="btn btn-success" />
            </div>


            <!-- Main Content -->
            <div class="content flex-grow-1">
                <h2 class="mb-4">Dashboard</h2>
            </div>
        </div>

    </form>
</asp:Content>
