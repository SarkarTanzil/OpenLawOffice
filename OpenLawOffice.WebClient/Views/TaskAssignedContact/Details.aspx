﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<OpenLawOffice.WebClient.ViewModels.Tasks.TaskAssignedContactViewModel>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Details
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>Details</h2>

    <table class="detail_table">
        <tr>
            <td class="display-label">Task</td>
            <td class="display-field"><%: Model.Task.Title %></td>
        </tr>
        <tr>
            <td class="display-label">User</td>
            <td class="display-field"><%: Model.Contact.DisplayName %>
            </td>
        </tr>
        <tr>
            <td class="display-label">Assignment</td>
            <td class="display-field">
                <%: Model.AssignmentType %>
            </td>
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

<asp:Content ID="Content3" ContentPlaceHolderID="MenuContent" runat="server">
    <li>Navigation</li>
    <ul style="list-style: none outside none; padding-left: 1em;">
        <li><%: Html.ActionLink("Edit", "Edit", new { id = Model.Id })%></li>
        <li><%: Html.ActionLink("Delete ", "Delete", new { id = Model.Id })%></li>
        <li><%: Html.ActionLink("List", "Contacts", "Tasks", new { id = Model.Task.Id }, null)%></li>
    </ul>
</asp:Content>