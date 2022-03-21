<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Address.aspx.cs" Inherits="DatabaseCoursework.Address" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Address</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">

</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:Coursework %>" 
                DeleteCommand="DELETE FROM &quot;ADDRESS&quot; WHERE &quot;ID&quot; = :ID" 
                InsertCommand="INSERT INTO &quot;ADDRESS&quot; (&quot;COUNTRY&quot;, &quot;ID&quot;, &quot;STATE&quot;, &quot;CITY&quot;, &quot;STREET&quot;) VALUES (:Country, :ID, :STATE, :CITY, :STREET)" ProviderName="<%$ ConnectionStrings:Coursework.ProviderName %>" 
                SelectCommand="SELECT &quot;COUNTRY&quot;, &quot;ID&quot;, &quot;STATE&quot;, &quot;CITY&quot;, &quot;STREET&quot; FROM &quot;ADDRESS&quot;" 
                UpdateCommand="UPDATE &quot;ADDRESS&quot; SET &quot;COUNTRY&quot; = :COUNTRY, &quot;STATE&quot; = :STATE, &quot;CITY&quot; = :CITY, &quot;STREET&quot; = :STREET WHERE &quot;ID&quot; = :ID">
                <DeleteParameters>
                    <asp:Parameter Name="ID" Type="String" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="COUNTRY" Type="String" />
                    <asp:Parameter Name="ID" Type="String" />
                    <asp:Parameter Name="STATE" Type="String" />
                    <asp:Parameter Name="CITY" Type="String" />
                    <asp:Parameter Name="STREET" Type="String" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="COUNTRY" Type="String" />
                    <asp:Parameter Name="STATE" Type="String" />
                    <asp:Parameter Name="CITY" Type="String" />
                    <asp:Parameter Name="STREET" Type="String" />
                    <asp:Parameter Name="ID" Type="String" />
                </UpdateParameters>
            </asp:SqlDataSource>
            <br />
            <div class="container">    
            <asp:GridView CSSClass="table table-condensed table-hover" ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="ID" DataSourceID="SqlDataSource1">
                <Columns>
                    <asp:BoundField DataField="COUNTRY" HeaderText="COUNTRY" SortExpression="COUNTRY" />
                    <asp:BoundField DataField="ID" HeaderText="ID" ReadOnly="True" SortExpression="ID" />
                    <asp:BoundField DataField="STATE" HeaderText="STATE" SortExpression="STATE" />
                    <asp:BoundField DataField="CITY" HeaderText="CITY" SortExpression="CITY" />
                    <asp:BoundField DataField="STREET" HeaderText="STREET" SortExpression="STREET" />
                    <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                </Columns>
            </asp:GridView>
            <br />
            <asp:FormView ID="FormView1" runat="server" DataKeyNames="ID" DataSourceID="SqlDataSource1">
                <InsertItemTemplate>
                    <div class="container">
                        <div class="align-content-xl-center">
                            <div class="align-content-center">
                                <asp:Label CSSClass="form-label" ID="IDLABEL" runat="server" Text="Id:"/>
                    <asp:TextBox CSSClass="form-control" ID="COUNTRYTextBox" runat="server" Text='<%# Bind("COUNTRY") %>' />
                    <br />
                    <asp:Label CSSClass="form-label" ID="Label1" runat="server" Text="Country:"/>
                    <asp:TextBox CSSClass="form-control" ID="IDTextBox" runat="server" Text='<%# Bind("ID") %>' />
                    <br />
                    <asp:Label CSSClass="form-label" ID="Label2" runat="server" Text="State:"/>
                    <asp:TextBox CSSClass="form-control" ID="STATETextBox" runat="server" Text='<%# Bind("STATE") %>' />
                    <br />
                    <asp:Label CSSClass="form-label" ID="Label3" runat="server" Text="City:"/>
                    <asp:TextBox CSSClass="form-control" ID="CITYTextBox" runat="server" Text='<%# Bind("CITY") %>' />
                    <br />
                    <asp:Label CSSClass="form-label" ID="Label4" runat="server" Text="Street:"/>
                    <asp:TextBox CSSClass="form-control" ID="STREETTextBox" runat="server" Text='<%# Bind("STREET") %>' />
                    <br />
                    <asp:LinkButton CSSClass="btn btn-success" ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" />
                    &nbsp;<asp:LinkButton CSSClass="btn btn-success" ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                            </div>
                        </div>
                    </div>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:LinkButton CSSClass="btn btn-dark" ID="NewButton" runat="server" CausesValidation="False" CommandName="New" Text="Insert Address" />
                </ItemTemplate>
            </asp:FormView>
        </div>
    </div>
    </form>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js" integrity="sha384-7+zCNj/IqJ95wo16oMtfsKbZ9ccEh31eOz1HGyDuCQ6wgnyJNSYdrPa03rtR1zdB" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js" integrity="sha384-QJHtvGhmr9XOIpI6YVutG+2QOK9T+ZnN4kzFN1RtK3zEFEIsxhlmWl5/YESvpZ13" crossorigin="anonymous"></script>
</body>
</html>
