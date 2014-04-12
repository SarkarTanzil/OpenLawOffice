﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<OpenLawOffice.WebClient.ViewModels.Matters.MatterViewModel>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Details
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MenuContent" runat="server">
    <li>Navigation</li>
    <ul style="list-style: none outside none; padding-left: 1em;">
        <li><%: Html.ActionLink("New Matter", "Create") %></li>
        <li><%: Html.ActionLink("Edit", "Edit", new { id = Model.Id })%></li>
        <li><%: Html.ActionLink("Delete ", "Delete", new { id = Model.Id })%></li>
        <li><%: Html.ActionLink("List", "Index") %></li>
    </ul>
    <li><%: Html.ActionLink("Tags", "Tags", new { id = Model.Id })%></li>
    <li><%: Html.ActionLink("Responsible Users", "ResponsibleUsers", new { id = Model.Id })%></li>
    <li><%: Html.ActionLink("Contacts", "Contacts", new { id = Model.Id })%></li>
    <li><%: Html.ActionLink("Tasks", "Tasks", "Matters", new { id = Model.Id }, null)%> (<%: Html.ActionLink("Add", "Create", "Tasks", new { controller = "Matters", MatterId = Model.Id }, null)%>)</li>
    <li><%: Html.ActionLink("Notes", "Notes", "Matters", new { id = Model.Id }, null)%> (<%: Html.ActionLink("Add", "Create", "Notes", new { controller = "Matters", MatterId = Model.Id }, null)%>)</li>
    <li><%: Html.ActionLink("Documents", "Documents", "Matters", new { id = Model.Id }, null)%> (<%: Html.ActionLink("Add", "AddDocument", new { controller = "Matters", id = Model.Id }) %>)</li>
    <li><%: Html.ActionLink("Times", "Time", "Matters", new { id = Model.Id }, null)%> (<%: Html.ActionLink("Add", "AddTime", new { controller = "Matters", id = Model.Id }) %>)</li>
    <li><%: Html.ActionLink("Permissions", "Acls", "Matters")%></li>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">

    <h2>Details</h2>

    <table class="detail_table">
        <tr>
            <td class="display-label">Id</td>
            <td class="display-field"><%: Model.Id %></td>
        </tr>
        <tr>
            <td class="display-label">Parent</td>
            <td class="display-field">
            <% if (Model.Parent != null)
               { %>
                <%: Model.Parent.Title%>
            <% } %></td>
        </tr>
        <tr>
            <td class="display-label">Title</td>
            <td class="display-field"><%: Model.Title %></td>
        </tr>
        <tr>
            <td class="display-label">Synopsis</td>
            <td class="display-field"><%: Model.Synopsis %></td>
        </tr>
    </table>

    <table class="detail_table">
        <tr>
            <td colspan="5" style="font-weight: bold;">Core Details</td>
        </tr>
        <tr>
            <td class="display-label">Created By</td>
            <td class="display-field"><%: Model.CreatedBy.Username %></td>
            <td style="width: 10px;"></td>
            <td class="display-label">Created At</td>
            <td class="display-field"><%: String.Format("{0:g}", DateTime.SpecifyKind(Model.UtcCreated.Value, DateTimeKind.Utc).ToLocalTime())%></td>
        </tr>
        <tr>
            <td class="display-label">Modified By</td>
            <td class="display-field"><%: Model.ModifiedBy.Username %></td>
            <td style="width: 10px;"></td>
            <td class="display-label">Modified At</td>
            <td class="display-field"><%: String.Format("{0:g}", DateTime.SpecifyKind(Model.UtcModified.Value, DateTimeKind.Utc).ToLocalTime())%></td>
        </tr>
        <tr>
            <td class="display-label">Disabled By</td>
            <% if (Model.DisabledBy != null)
               { %>
            <td class="display-field"><%: Model.DisabledBy.Username%></td>
            <% }
               else
               { %>
               <td />
            <% } %>
            <td style="width: 10px;"></td>
            <td class="display-label">Disabled At</td>
            <% if (Model.UtcDisabled.HasValue)
               { %>
            <td class="display-field"><%: String.Format("{0:g}", DateTime.SpecifyKind(Model.UtcDisabled.Value, DateTimeKind.Utc).ToLocalTime())%></td>
            <% }
               else
               { %>
            <td class="display-field"></td>
            <% } %>
        </tr>
    </table>
</asp:Content>

