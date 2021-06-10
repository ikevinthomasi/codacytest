<%@ Page Title="" Language="C#" MasterPageFile="~/AED_Main_MasterPage.master" AutoEventWireup="true" CodeFile="ED_User_Review_COI.aspx.cs" Inherits="ED_User_Review_COI" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
<style>
    .counter {
    background-color:#d7e3fa;
    padding: 20px 0;
    border-radius: 5px;
    }

    .count-title {
        font-size: 40px;
        font-weight: normal;
        margin-top: 10px;
        margin-bottom: 0;
        text-align: center;
    }

    .count-text {
        font-size: 13px;
        font-weight: normal;
        margin-top: 10px;
        margin-bottom: 0;
        text-align: center;
    }

    .fa-2x {
        margin: 0 auto;
        float: none;
        display: table;
        color: #4ad1e5;
    }
</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <div class="row">
        <div class="col-md-12">
            <label class="form-control-lg"><b>Reviewer Review Declaration Forms</b></label>
        </div>
    </div>

    <section id="secGuide" runat="server" style="background-color: #055999;">
        <div class="row">
            <div class="col-md-12">
                <br />
                <p class="text-light small">&nbsp;Dear Reviewer,</p>
                <p class="text-light small">
                    &nbsp;Please take an action if conflict of interest occur and update action taken accordingly.<br />
                    &nbsp;UEM Edgenta Risk & Compliance and Human Resource will be notified if no action taken by HOD within 2 weeks after the date of submission.
                </p>
                <br />
            </div>
        </div>
    </section>

    <br />

	<div class="row text-center">
	    <div class="col-md-2">
	        <div class="counter">
                <i class="fa fa-users fa-2x text-primary"></i>
                <h2 id="lblC1" runat="server" class="timer count-title count-number" data-speed="1500"></h2>
                <p class="count-text ">Total Number of Employee</p>
            </div>
	    </div>
        <div class="col-md-2">
            <div class="counter">
                <i class="fa fa-user-plus fa-2x text-primary"></i>
                <h2 id="lblC2" runat="server" class="timer count-title count-number" data-speed="1500"></h2>
                <p class="count-text ">Total Submission</p>
            </div>
        </div>
        <div class="col-md-2">
            <div class="counter">
                <i class="fa fa-users-cog fa-2x text-primary"></i>
                <h2 id="lblC3" runat="server" class="timer count-title count-number" data-speed="1500"></h2>
                <p class="count-text ">Total COI Disclosed</p>
            </div>
        </div>
        <div class="col-md-2">
	        <div class="counter">
                <i class="fa fa-user-clock fa-2x text-primary"></i>
                <h2 id="lblC4" runat="server" class="timer count-title count-number" data-speed="1500"></h2>
                <p class="count-text ">Total COI Pending Review</p>
            </div>
	    </div>
        
        <div class="col-md-2">
	        <div class="counter">
                <i class="fa fa-user-clock fa-2x text-primary"></i>
                <h2 id="lblC5" runat="server" class="timer count-title count-number" data-speed="1500"></h2>
                <p class="count-text ">Total COI Pending Closure</p>
            </div>
	    </div>
        <div class="col-md-2">
            <div class="counter">
                <i class="fa fa-user-lock fa-2x text-primary"></i>
                <h2 id="lblC6" runat="server" class="timer count-title count-number" data-speed="1500"></h2>
                <p class="count-text ">Total Closed COI</p>
            </div>
        </div>
    </div>

    <br />

    <div class="row">
        <div class="col-md-12">
            <label class="form-control-sm"><b>Total Pending Review</b></label>
        </div>
    </div>

    <div class="row">
        <div class="col-md-12">
            <div class="table-responsive">
                <asp:GridView ID="gvListing" runat="server" CssClass="table table-bordered table-sm small" AutoGenerateColumns="false" Width="100%" ShowHeaderWhenEmpty="true">
                <Columns>
                    <asp:TemplateField ShowHeader="false" ItemStyle-Width="1%" ItemStyle-CssClass="text-center">
                    <ItemTemplate>
                        <asp:Label ID="lblNo" runat="server" Text='<%# Container.DataItemIndex + 1 %>'></asp:Label>
                    </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Declaration No" ItemStyle-Width="15%" ItemStyle-CssClass="text-center" HeaderStyle-CssClass="text-center" HeaderStyle-Wrap="false">
                    <ItemTemplate>
                        <asp:Label ID="lblDeclareNo" runat="server" OnDataBinding="lblDeclareNo_DataBinding"></asp:Label>
                    </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Declaration Details" ItemStyle-Width="40%" ItemStyle-CssClass="text-left" HeaderStyle-CssClass="text-left" HeaderStyle-Wrap="false">
                    <ItemTemplate>
                        <asp:Label ID="lblDeclareName" runat="server" Text='<%# Eval("staff_ic_name") %>'></asp:Label><br />
                        <asp:Label ID="lblDeclareDate" runat="server" Text='<%#Convert.ToDateTime(Eval("declare_date")).ToString("dd-MMM-yyyy HH:mm:ss") %>'></asp:Label>
                    </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="COI" ItemStyle-Width="10%" ItemStyle-CssClass="text-center" HeaderStyle-CssClass="text-center" HeaderStyle-Wrap="false">
                    <ItemTemplate>
                        <asp:Label ID="lblCOI" runat="server" Text='<%# Eval("coi_flag") %>'></asp:Label>
                    </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Declaration Type" ItemStyle-Width="10%"  ItemStyle-CssClass="text-center" HeaderStyle-CssClass="text-center" HeaderStyle-Wrap="false">
                    <ItemTemplate>
                        <asp:Label ID="lblType" runat="server" Text='<%# Eval("form_name") %>'></asp:Label>
                    </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Status" ItemStyle-Width="10%"  ItemStyle-CssClass="text-center" HeaderStyle-CssClass="text-center" HeaderStyle-Wrap="false">
                    <ItemTemplate>
                        <asp:Label ID="lblStatus" runat="server" Text='<%# Eval("status") %>'></asp:Label>
                    </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
                <EmptyDataTemplate><asp:Label ID="lblDownEmpty" runat="server" CssClass="form-control form-control-sm" Text="No data found."></asp:Label></EmptyDataTemplate>
                <PagerStyle CssClass="pagination-ys" HorizontalAlign="Center" />
                </asp:GridView>
            </div>
        </div>
    </div>

    <br />

    <div class="row">
        <div class="col-md-12">
            <label class="form-control-sm"><b>Total Pending Closure</b></label>
        </div>
    </div>

    <div class="row">
        <div class="col-md-12">
            <div class="table-responsive">
                <asp:GridView ID="gvListingC" runat="server" CssClass="table table-bordered table-sm small" AutoGenerateColumns="false" Width="100%" ShowHeaderWhenEmpty="true">
                <Columns>
                    <asp:TemplateField ShowHeader="false" ItemStyle-Width="1%" ItemStyle-CssClass="text-center">
                    <ItemTemplate>
                        <asp:Label ID="lblNoC" runat="server" Text='<%# Container.DataItemIndex + 1 %>'></asp:Label>
                    </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Declaration No" ItemStyle-Width="15%" ItemStyle-CssClass="text-center" HeaderStyle-CssClass="text-center" HeaderStyle-Wrap="false">
                    <ItemTemplate>
                        <asp:Label ID="lblDeclareNoC" runat="server" OnDataBinding="lblDeclareNoC_DataBinding"></asp:Label>
                    </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Declaration Details" ItemStyle-Width="40%" ItemStyle-CssClass="text-left" HeaderStyle-CssClass="text-left" HeaderStyle-Wrap="false">
                    <ItemTemplate>
                        <asp:Label ID="lblDeclareNameC" runat="server" Text='<%# Eval("staff_ic_name") %>'></asp:Label><br />
                        <asp:Label ID="lblDeclareDateC" runat="server" Text='<%#Convert.ToDateTime(Eval("declare_date")).ToString("dd-MMM-yyyy HH:mm:ss") %>'></asp:Label>
                    </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="COI" ItemStyle-Width="10%" ItemStyle-CssClass="text-center" HeaderStyle-CssClass="text-center" HeaderStyle-Wrap="false">
                    <ItemTemplate>
                        <asp:Label ID="lblCOIC" runat="server" Text='<%# Eval("coi_flag") %>'></asp:Label>
                    </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Declaration Type" ItemStyle-Width="10%"  ItemStyle-CssClass="text-center" HeaderStyle-CssClass="text-center" HeaderStyle-Wrap="false">
                    <ItemTemplate>
                        <asp:Label ID="lblTypeC" runat="server" Text='<%# Eval("form_name") %>'></asp:Label>
                    </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Status" ItemStyle-Width="10%"  ItemStyle-CssClass="text-center" HeaderStyle-CssClass="text-center" HeaderStyle-Wrap="false">
                    <ItemTemplate>
                        <asp:Label ID="lblStatusC" runat="server" Text='<%# Eval("status") %>'></asp:Label>
                    </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
                <EmptyDataTemplate><asp:Label ID="lblDownEmpty" runat="server" CssClass="form-control form-control-sm" Text="No data found."></asp:Label></EmptyDataTemplate>
                <PagerStyle CssClass="pagination-ys" HorizontalAlign="Center" />
                </asp:GridView>
            </div>
        </div>
    </div>

    <br />

    <div class="row">
        <div class="col-md-12">
            <label class="form-control-sm"><b>Total Employee</b></label>
        </div>
    </div>

    <div class="row">
        <div class="col-md-12">
            <div class="table-responsive">
                <asp:GridView ID="gvStaffList" runat="server" CssClass="table table-bordered table-sm small" AutoGenerateColumns="false" Width="100%" ShowHeaderWhenEmpty="true">
                <Columns>
                    <asp:TemplateField ShowHeader="false" ItemStyle-Width="1%" ItemStyle-CssClass="text-center">
                    <ItemTemplate>
                        <asp:Label ID="lblNoG" runat="server" Text='<%# Container.DataItemIndex + 1 %>'></asp:Label>
                    </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Declaration No" ItemStyle-Width="20%" ItemStyle-CssClass="text-left" HeaderStyle-CssClass="text-center" HeaderStyle-Wrap="false">
                    <ItemTemplate>
                        <asp:Label ID="lblStaffName" runat="server" OnDataBinding="lblStaffName_DataBinding"></asp:Label>
                    </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Division / Department / Position " ItemStyle-Width="65%" ItemStyle-CssClass="text-left" HeaderStyle-CssClass="text-center" HeaderStyle-Wrap="false">
                    <ItemTemplate>
                        <asp:Label ID="lblDivision" runat="server" Text='<%# Eval("division") %>'></asp:Label><br />
                        <asp:Label ID="lblDepartment" runat="server" Text='<%# Eval("department") %>'></asp:Label><br />
                        <asp:Label ID="lblPosition" runat="server" Text='<%# Eval("position") %>'></asp:Label>
                    </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
                <EmptyDataTemplate><asp:Label ID="lblDownEmpty" runat="server" CssClass="form-control form-control-sm" Text="No data found."></asp:Label></EmptyDataTemplate>
                <PagerStyle CssClass="pagination-ys" HorizontalAlign="Center" />
                </asp:GridView>
            </div>
        </div>
    </div>

    <br />

<script>
    (function ($)
    {
        $.fn.countTo = function (options)
        {
		    options = options || {};
		
            return $(this).each(function ()
            {
			    // set options for current element
                var settings = $.extend({}, $.fn.countTo.defaults,
                {
				    from:            $(this).data('from'),
				    to:              $(this).data('to'),
				    speed:           $(this).data('speed'),
				    refreshInterval: $(this).data('refresh-interval'),
				    decimals:        $(this).data('decimals')
			    }, options);
			
			    // how many times to update the value, and how much to increment the value on each update
			    var loops = Math.ceil(settings.speed / settings.refreshInterval),
				    increment = (settings.to - settings.from) / loops;
			
			    // references & variables that will change with each update
			    var self = this,
				    $self = $(this),
				    loopCount = 0,
				    value = settings.from,
				    data = $self.data('countTo') || {};
			
			    $self.data('countTo', data);
			
			    // if an existing interval can be found, clear it first
                if (data.interval)
                {
				    clearInterval(data.interval);
			    }
			    data.interval = setInterval(updateTimer, settings.refreshInterval);
			
			    // initialize the element with the starting value
			    render(value);
			
                function updateTimer()
                {
				    value += increment;
				    loopCount++;
				
				    render(value);
				
                    if (typeof (settings.onUpdate) == 'function')
                    {
					    settings.onUpdate.call(self, value);
				    }
				
                    if (loopCount >= loops)
                    {
					    // remove the interval
					    $self.removeData('countTo');
					    clearInterval(data.interval);
					    value = settings.to;
					
                        if (typeof (settings.onComplete) == 'function')
                        {
						    settings.onComplete.call(self, value);
					    }
				    }
			    }
			
			    function render(value) {
				    var formattedValue = settings.formatter.call(self, value, settings);
				    $self.html(formattedValue);
			    }
		    });
	    };
	
        $.fn.countTo.defaults =
        {
		    from: 0,               // the number the element should start at
		    to: 0,                 // the number the element should end at
		    speed: 1000,           // how long it should take to count between the target numbers
		    refreshInterval: 100,  // how often the element should be updated
		    decimals: 0,           // the number of decimal places to show
		    formatter: formatter,  // handler for formatting the value before rendering
		    onUpdate: null,        // callback method for every time the element is updated
		    onComplete: null       // callback method for when the element finishes updating
	    };
	
        function formatter(value, settings)
        {
		    return value.toFixed(settings.decimals);
	    }
    }(jQuery));

    jQuery(function ($)
    {
        // custom formatting example
        $('.count-number').data('countToOptions',
        {
            formatter: function (value, options)
            {
	            return value.toFixed(options.decimals).replace(/\B(?=(?:\d{3})+(?!\d))/g, ',');
            }
        });
  
        // start all the timers
        $('.timer').each(count);  
  
        function count(options)
        {
            var $this = $(this);
            options = $.extend({}, options || {}, $this.data('countToOptions') || {});
            $this.countTo(options);
        }
    });
</script>

</asp:Content>

