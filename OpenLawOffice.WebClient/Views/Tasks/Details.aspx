﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<OpenLawOffice.WebClient.ViewModels.Tasks.TaskViewModel>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Task Details
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <script language="javascript">
        $(function () {
            $("#closeTaskDialog").dialog({
                autoOpen: false,
                width: 400,
                show: {
                    effect: "blind",
                    duration: 100
                },
                hide: {
                    effect: "fade",
                    duration: 100
                }
            });

            $("#newTaskHelp").click(function () {
                $("#closeTaskDialog").dialog("open");
            });
        });
    </script>

    <div id="roadmap">
        <div class="zero">Matter: [<%: Html.ActionLink((string)ViewData["Matter"], "Details", "Matters", new { id = ViewData["MatterId"] }, null) %>]</div>
        <div id="current" class="one">Task: <%: Model.Title %><a id="pageInfo" class="btn-question" style="padding-left: 15px;">Help</a></div>
    </div>
            
<% if (Model.Active)
    { %>
    <div class="options_div" style="text-align: right;">        
    <% using (Html.BeginForm("Close", "Tasks", new { Id = RouteData.Values["Id"] }, FormMethod.Post, new { id = "CloseForm" }))
       {%>
    <%: Html.ValidationSummary(true)%>
        <div style="padding-right: 10px; display:inline;">
            <a id="newTaskHelp" class="btn-question" style="padding-left: 15px;"></a>
            <input type="checkbox" id="NewTask" name="NewTask" checked="checked" /> Create Follow-up Task 
        </div>
        
        <input type="submit" value="Close" 
            style="background-image: url('/Content/fugue-icons-3.5.6/icons-shadowless/cross.png'); 
            background-position: left center; background-repeat: no-repeat; padding-left: 20px;" />
    <% } %>

    </div>
<% } %>

    <table class="detail_table">
        <tr>
            <td colspan="5" class="detail_table_heading">
                Task Details
            </td>
        </tr>
        <tr>
            <td class="display-label" style="width: 125px;">
                Projected Start
            </td>
            <td class="display-field">
                <% if (Model.ProjectedStart.HasValue)
                   { %>
                <%: String.Format("{0:g}", Model.ProjectedStart.Value)%>
                <% } %>
            </td>            
            <td></td>
            <td class="display-label" style="width: 125px;">
                Projected End
            </td>
            <td class="display-field">
                <% if (Model.ProjectedEnd.HasValue)
                   { %>
                <%: String.Format("{0:g}", Model.ProjectedEnd.Value)%>
                <% } %>
            </td>
        </tr>
        <tr>
            <td class="display-label" style="width: 125px;">
                Due Date
            </td>
            <td class="display-field">
                <% if (Model.DueDate.HasValue)
                   { %>
                <%: String.Format("{0:g}", Model.DueDate.Value)%>
                <% } %>
            </td>      
            <td></td>
            <td class="display-label" style="width: 125px;">
                Actual End
            </td>
            <td class="display-field">
                <% if (Model.ActualEnd.HasValue)
                   { %>
                <%: String.Format("{0:g}", Model.ActualEnd.Value)%>
                <% } %>
            </td>
        </tr>
        <tr>
            <td class="display-label" style="width: 125px;">
                Active
            </td>
            <td class="display-field">
                <%: Html.CheckBoxFor(model => model.Active, new { disabled = true })%>
            </td>
        </tr>
        <tr>
            <td class="display-label" style="width: 125px;">
                Description
            </td>
            <td class="display-field" colspan="4">
                <%= Model.Description%>
            </td>
        </tr>
    </table>
    
    <table class="listing_table">    
        <tr>
            <td colspan="4" class="listing_table_heading">
                Notes
            </td>
        </tr>
        <tr>
            <th style="text-align: center; width: 170px;">
                Date/Time
            </th>
            <th style="text-align: center;">
                Title
            </th>
            <th style="text-align: center; width: 20px;">
                
            </th>
        </tr>
        <%  bool altRow = true; 
            foreach (var note in Model.Notes)
            {
               altRow = !altRow;
               if (altRow)
               { %> <tr class="tr_alternate"> <% }
               else
               { %> <tr> <% }
                %>
            <td>
                <%: note.Timestamp %>
            </td>
            <td>
                <%: Html.ActionLink(note.Title, "Details", "Notes", new { id = note.Id.Value }, null)%>
            </td>
            <td>
                <%: Html.ActionLink("Edit", "Edit", "Notes", new { id = note.Id.Value }, new { @class = "btn-edit", title = "Edit" })%>
            </td>
        </tr>
        <%  } %>
    </table>
    
    <br />
<% Html.RenderPartial("CoreDetailsView"); %>

    <div id="pageInfoDialog" title="Help">
        <p>
        <span style="font-weight: bold; text-decoration: underline;">Info:</span>
        Displays detailed information about the task.
        </p>
    </div>
    <div id="closeTaskDialog" title="Close Task">
        <p>
        <span style="font-weight: bold; text-decoration: underline;">Create Follow-Up Task:</span>
        <br />
        In most situations, a task being closed should be followed by another task.  For example:
        Completing a task to send a client an request for information should have a task to follow-up
        created, or completing a task to draft a motion should be followed by a task to file the motion.
        </p>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MenuContent" runat="server">
    <li>Actions</li>
    <ul style="list-style: none outside none; padding-left: 1em;">
        <li>
            <%: Html.ActionLink("New Task", "Create", new { MatterId = ViewData["MatterId"] })%></li>
        <li>
            <%: Html.ActionLink("Edit", "Edit", new { id = Model.Id })%></li>
    </ul>
    <li>
        <%: Html.ActionLink("Matter", "Details", "Matters", new { id = ViewData["MatterId"] }, null)%></li>
    <li>
        <%: Html.ActionLink("Tags", "Tags", "Tasks", new { id = Model.Id }, null)%>
        (<%: Html.ActionLink("Add", "Create", "TaskTags", new { id = Model.Id }, null)%>)</li>
    <li>
        <%: Html.ActionLink("Responsible Users", "ResponsibleUsers", "Tasks", new { id = Model.Id }, null)%></li>
    <li>
        <%: Html.ActionLink("Contacts", "Contacts", "Tasks", new { id = Model.Id }, null)%></li>
    <li>
        <%: Html.ActionLink("Events", "Events", "Tasks", new { id = Model.Id }, null)%>
        (<%: Html.ActionLink("Add", "Create", "Events", new { controller = "Tasks", TaskId = Model.Id }, null)%>)</li>
    <li>
        <%: Html.ActionLink("Notes", "Notes", "Tasks", new { id = Model.Id }, null)%>
        (<%: Html.ActionLink("Add", "Create", "Notes", new { controller = "Tasks", TaskId = Model.Id }, null)%>)</li>
    <li>
        <%: Html.ActionLink("Documents", "Documents", "Tasks", new { id = Model.Id }, null)%>
        (<%: Html.ActionLink("Add", "Create", "Documents", new { controller = "Tasks", TaskId = Model.Id }, null)%>)</li>
    <li>
        <%: Html.ActionLink("Time", "Time", "Tasks", new { id = Model.Id }, null)%>
        (<%: Html.ActionLink("Add", "SelectContactToAssign", "TaskTime", new { TaskId = Model.Id }, null)%>)</li>
</asp:Content>