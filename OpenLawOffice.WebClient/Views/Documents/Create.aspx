﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<OpenLawOffice.WebClient.ViewModels.Documents.DocumentViewModel>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Create Document
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    
    <div id="roadmap">
        <div class="zero">Matter: [<%: Html.ActionLink((string)ViewData["Matter"], "Details", "Matters", new { id = ViewData["MatterId"] }, null) %>]</div>
        <% if (ViewData["Task"] != null)
           { %>
        <div class="one">Task: [<%: Html.ActionLink((string)ViewData["Task"], "Details", "Tasks", new { id = ViewData["TaskId"] }, null)%>]</div>
        <div id="current" class="two">Create Document<a id="pageInfo" class="btn-question" style="padding-left: 15px;">Help</a></div>
        <% }
           else
           { %>           
        <div id="current" class="one">Create Document<a id="pageInfo" class="btn-question" style="padding-left: 15px;">Help</a></div>
        <% } %>
    </div>
    
    <% using (Html.BeginForm("Create", "Documents", FormMethod.Post, new { enctype = "multipart/form-data" }))
       {%>
    <%: Html.ValidationSummary(true)%>
    <% if (Request["MatterId"] != null)
       { %>
    <%: Html.Hidden("MatterId", Request["MatterId"]) %>
    <% }
       else if (Request["TaskId"] != null)
       { %>
    <%: Html.Hidden("TaskId", Request["TaskId"])%>
    <% } %>
    <table class="detail_table">
        <tr>
            <td class="display-label">
                Date
            </td>
            <td class="display-field">
                <%: Html.EditorFor(model => model.Date)%>
                <%: Html.ValidationMessageFor(model => model.Date)%>
            </td>
        </tr>
        <tr>
            <td class="display-label">
                Title<span class="required-field" title="Required Field">*</span>
            </td>
            <td class="display-field">
                <%: Html.TextBoxFor(model => model.Title)%>
                <%: Html.ValidationMessageFor(model => model.Title)%>
            </td>
        </tr>
        <tr>
            <td class="display-label">
                File<span class="required-field" title="Required Field">*</span>
            </td>
            <td class="display-field">
                <input type="file" name="file" id="file" />
            </td>
        </tr>
    </table>
    <p>
        <input type="submit" value="Save" />
    </p>
    <% } %>

    <div id="pageInfoDialog" title="Help">
        <p>
        <span style="font-weight: bold; text-decoration: underline;">Info:</span>
        Fill in the information on this page to create a new document.  Required fields are indicated with an
        <span style="color: #ee0000;font-size: 12px;cursor:help;" title="Required Field">*</span>.
        Relationships with this document from the matter and/or task where it was added will be automatically created.<br /><br />
        <span style="font-weight: bold; text-decoration: underline;">Usage:</span>
        Fields marked with an <span style="color: #ee0000;font-size: 12px;cursor:help;" title="Required Field">*</span> are required.
        </p>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MenuContent" runat="server">
<% if (Request["MatterId"] != null)
    { %>
    <li><%: Html.ActionLink("Matter", "Details", "Matters", new { id = Request["MatterId"] }, null)%></li>
<%  }
    if (Request["TaskId"] != null)
    { %>
    <li><%: Html.ActionLink("Task", "Details", "Tasks", new { id = Request["TaskId"] }, null)%></li>
<%  } %>
</asp:Content>