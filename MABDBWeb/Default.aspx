<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="MABDBWeb._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

  

    <p>
    <strong>Main links:</strong></p>
<ul>
    <li><a href="InvestorApplicantsNewAll.aspx">New Investor Applications</a><ul>
        <li>Investors Auto-Rejected
            <ul>
                <li>Not Informed</li>
                <li>Informed</li>
            </ul>
        </li>
        <li>Investors Auto-Accepted<ul>
            <li>Not Informed</li>
            <li>Informed</li>
            </ul>
        </li>
        </ul>
    </li>
    <li><a href="BuyerApplicantsNewAll.aspx">New Buyer Applications</a><ul>
        <li>Buyers Auto-Rejected<ul>
            <li>Not Informed</li>
            <li>Informed</li>
            </ul>
        </li>
        <li>Buyers Auto-Accepted<ul>
            <li>Not Informed</li>
            <li>Informed</li>
            </ul>
        </li>
        </ul>
    </li>
    <li>Buyer Applications under credit assessment</li>
    <li>All Investors</li>
    <li>All Buyers</li>
    <li>All Properties</li>
</ul>

  

</asp:Content>
