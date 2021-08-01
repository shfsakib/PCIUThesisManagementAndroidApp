<%@ Page Title="" Language="C#" MasterPageFile="~/root.Master" AutoEventWireup="true" CodeBehind="send-application.aspx.cs" Inherits="PCIUTMSApp.app.send_application" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <link href="../Link/editor.css" rel="stylesheet" />
    <div class="col-md-12">
        <div class="row">
            <div class="col-12" style="padding: 10px;">
                <div id="container">
                    <fieldset>
                        <button class="fontStyle italic" onclick="document.execCommand('italic', false, null);return false;" title="Italicize Highlighted Text"><i class="fas fa-italic"></i></button>
                        <button class="fontStyle bold" onclick="document.execCommand( 'bold',false,null);return false;" title="Bold Highlighted Text"><i class="fas fa-bold"></i></button>
                        <button class="fontStyle underline" onclick="document.execCommand( 'underline',false,null);return false;"><i class="fas fa-underline"></i></button>
                        <select id="input-font" class="input" onchange="changeFont (this);">
                            <option value="Arial">Arial</option>
                            <option value="Helvetica">Helvetica</option>
                            <option value="Times New Roman">Times New Roman</option>
                            <option value="Sans serif">Sans serif</option>
                            <option value="Courier New">Courier New</option>
                            <option value="Verdana">Verdana</option>
                            <option value="Georgia">Georgia</option>
                            <option value="Palatino">Palatino</option>
                            <option value="Garamond">Garamond</option>
                            <option value="Comic Sans MS">Comic Sans MS</option>
                            <option value="Arial Black">Arial Black</option>
                            <option value="Tahoma">Tahoma</option>
                            <option value="Comic Sans MS">Comic Sans MS</option>
                        </select>
                        <button class="fontStyle strikethrough" style="margin-top: 3px!important" onclick="document.execCommand( 'strikethrough',false,null);return false;">
                            <i class="fas fa-remove-format"></i>
                        </button>
                        <button class="fontStyle align-left" onclick="document.execCommand( 'justifyLeft',false,null);return false;">
                            <i class="fas fa-align-left"></i>
                        </button>
                        <button class="fontStyle align-center" onclick="document.execCommand( 'justifyCenter',false,null);return false;">
                            <i class="fas fa-align-justify"></i>
                        </button>
                        <button class="fontStyle align-right" onclick="document.execCommand( 'justifyRight',false,null);return false;">
                            <i class="fas fa-align-right"></i>
                        </button>
                        <button class="fontStyle redo-apply" onclick="document.execCommand( 'redo',false,null);return false;">
                            <i class="fas fa-undo"></i>
                        </button>
                        <button class="fontStyle undo-apply" onclick="document.execCommand( 'undo',false,null);return false;">
                            <i class="fas fa-redo"></i>
                        </button>
                        <button class="fontStyle orderedlist" onclick="document.execCommand('insertOrderedList', false, null);return false;">
                            <i class="fas fa-list-ol"></i>
                        </button>
                        <button class="fontStyle unorderedlist" onclick="document.execCommand('insertUnorderedList',false, null);return false;">
                            <i class="fas fa-list-ul"></i>
                        </button>
                        <input class="color-apply" type="color" onchange="chooseColor()" style="border: none" id="myColor">

                        <!-- font size start -->
                        <select id="fontSize" onclick="changeSize()">
                            <option value="1">1</option>
                            <option value="2">2</option>
                            <option value="3">3</option>
                            <option value="4">4</option>
                            <option value="5">5</option>
                            <option value="6">6</option>
                            <option value="7">7</option>
                            <option value="8">8</option>
                        </select>
                        <!-- font size end -->

                    </fieldset>
                    <%--data-text="Enter comment...."--%>
                    <div id="editor1" contenteditable="true">
                        <div><b>Date</b></div>
                        <div><b>
                            <br>
                        </b></div>
                        <div>To</div>
                        <div>The Chairman</div>
                        <div>Department of&nbsp;<span style="font-weight: 700;">Department Name</span>,</div>
                        <div>Port City International University.&nbsp;</div>
                        <div>
                            <br>
                        </div>
                        <div>Through: <b>Your supervisor name</b>,</div>
                        <div>Department of <b>Department Name</b>,</div>
                        <div>Port City International University.&nbsp;</div>
                        <div>
                            <br>
                        </div>
                        <div>&nbsp;____________________</div>
                        <div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; Signature<br>
                        </div>
                        <div>
                            <br>
                        </div>
                        <div>Subject:&nbsp;&nbsp;<span style="font-weight: 700;"><u>Application for attending (Subject Name)</u></span>.</div>
                        <div>
                            <br>
                        </div>
                        <div>Dear Sir/Madam,</div>
                        <div>With due respect I would like to inform you that I am a student of <b>(B.Sc./M.Sc.)</b> in&nbsp;<span style="font-weight: 700;">Department Name</span>&nbsp;at Port City International University. My name is <b>Student Name</b>&nbsp;and ID number is <b>Student Id</b>, Program is&nbsp;<span style="font-weight: 700;">(B.Sc./M.Sc.)</span>&nbsp;in&nbsp;<span style="font-weight: 700;">Department Name</span>, Department of&nbsp;<span style="font-weight: 700;">Department Name</span>.&nbsp;</div>
                        <div>I am requesting you to give me permission to attend my <b>(presentation name)</b>. Therefore, I am looking forward to your kind consideration. Lastly, I would be very grateful to you if you consider my request.</div>
                        <div>
                            <br>
                        </div>
                        <div>Sincerely yours</div>
                        <div>
                            <br>
                        </div>
                        <div>&nbsp;______________________</div>
                        <div><span style="font-weight: 700;">Student Name</span><br>
                        </div>
                        <div>ID:&nbsp;<span style="font-weight: 700;">Student Id</span></div>
                        <div><span style="font-weight: 700;">(B.Sc./M.Sc.)</span>&nbsp;in&nbsp;<span style="font-weight: 700;">Department Name</span></div>
                        <div>Port City International University</div>
                    </div>

                </div>
            </div>
        </div>
    </div>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script src="../Link/editor.js"></script>

</asp:Content>
