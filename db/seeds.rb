# fill DB with group, material, and task data
users = [
	{ 
		name:     'Guest', 
		title:    'Web Developer',
		password: 'guest_password',
		contacts: [
			{
				title:      'mobile',
				value:      '(999) 999-9999'
			},
			{
				title:      'email',
				value:      'guest@gmail.com'
			},
			{
				title:      'github',
				value:      'bestguest'
			},
			{
				title:      'location',
				value:      'Any Town, WA'
			}
		],
		skills: [
			{ name: 'PHP' },
			{ name: 'MySQL' },
			{ name: 'HTML' },
			{ name: 'CSS' },
			{ name: 'PostCSS' },
			{ name: 'SASS' },
			{ name: 'JavaScript' },
			{ name: 'NPM' },
			{ name: 'PhotoShop' },
			{ name: 'MS Office certified' },
			{ name: 'Acrobat' },
			{ name: 'MVC' },
			{ name: 'Ruby' },
			{ name: 'Sinatra' },
			{ name: 'Postgresql' },
			{ name: 'Python' },
			{ name: 'Django' },
			{ name: 'Wordpress' },
		],
		jobs: [
			{
				employer:    'DareDevils Activewear',
				title:       'Web Developer',
				start_year:  2018,
				end_year:    2019,
				location:    'Bothell, WA',
				description: 'Created website for leotard manufacturer using LAMP stack. Intake forms enable customer to submit design samples and sizing data. Communications between vendor and customer are tracked until approval is reached. Email notifications alert vendor and customer of changes during order process. Vendor maintains site content via CRUD-style interface.'
			},
			{
				employer:    'Liberty Mutual Insurance',
				title:       'Associate Software Developer',
				start_year:  2012,
				end_year:    2013,
				location:    'Seattle, WA',
				description: 'Developed web-based request forms to collect user input and store information in database using JSP and Oracle. Implemented home-grown API to traverse requests through approval process. Used AJAX to update portions of forms without reloading entire pages. Identified and tested use case scenarios for projects during all phases of the development lifecycle.'
			},
			{
				employer:    'Liberty Mutual Insurance',
				title:       'Business Systems Analyst II',
				start_year:  2009,
				end_year:    2012,
				location:    'Seattle, WA',
				description: 'Determined project requirements by interviewing customers and mapping workflow processes. Authored technical specifications with wire frames to solidify customer demands and provide development blueprint. Developed web applications using Microsoft technology stack. Provided custom reporting options by integrating web applications with Microsoft Office and Adobe Acrobat using VBA and third-party API.'
			},
			{
				employer:    'Safeco Insurance',
				title:       'Web Developer',
				start_year:  2004,
				end_year:    2009,
				location:    'Seattle, WA',
				description: 'Created dynamic web applications using ASP.NET and SQL Server. Developed separate components for each facet of CRUD cycle. Authenticated user credentials by querying Active Directory via LDAP. Established team standards with design templates and code library. Contributed to standards revision process by presenting new features and refactoring existing code during weekly developer meetings.'
			},
			{
				employer:    'Safeco Insurance',
				title:       'Associate Web Developer',
				start_year:  2001,
				end_year:    2004,
				location:    'Seattle, WA',
				description: 'Created static web sites for various departments using HTML and CSS. Used JavaScript to create navigations and display conditional page elements. Developed web-based request forms that collected user input and forwarded information via email to the appropriate recipient using ASP and SMTP. Used JavaScript to perform calculations, validate and persist form data, and show or hide input fields based on user selections.'
			},
			{
				employer:    'Safeco Insurance',
				title:       'Electronic Publishing Operator',
				start_year:  1997,
				end_year:    2001,
				location:    'Seattle, WA',
				description: 'Produced variety of long documents for print and online viewing using desktop publishing software. Enhanced user experience by inserting hyperlinks, bookmarks, and event-driven annotations into online documentation programmatically with PDFMark. Converted FrameMaker files to web-based format by applying HTML markup to content and CSS to document structure to standardize appearance. Added search and indexing capability by compiling documents as HTML Help. Used JavaScript to show or hide page elements in response to user actions.'
			},
			{
				employer:    'Aon Consulting',
				title:       'PC Specialist',
				start_year:  1996,
				end_year:    1997,
				location:    'Seattle, WA',
				description: 'Produced variety of marketing materials including reports, tables, manuals, brochures, and presentations as required by account representatives and brokers. Operated scanner and photo editing software for inserting custom images into documents. Integrated word processing, spreadsheet, and graphical elements via object linking and embedding. Created relational database to maintain client information and generate prospectuses.'
			},
			{
				employer:    'State Farm Insurance',
				title:       'Senior Word Processor',
				start_year:  1993,
				end_year:    1996,
				location:    'Dupont, WA',
				description: 'Produced variety of documents including correspondence, reports, tables, forms, newsletters, and manuals via regional transcription system. Created templates with stylesheets and macros to increase department productivity. Developed replacement for paper-based forms to be printed on demand at remote office locations. Trained coworkers on advanced software features such as charts and graphics, mail merge, and intricate page layouts. Created batch files to automate file management tasks and increase department efficiency.'
			},
		],
		projects: [
			{
				title:       'Interactive Resume',
				year:        2020,
				description: 'This website uses JavaScript objects, functions, conditions, and control structures to read content from a JSON file and dynamically render it within a pre-defined template.'
			},
			{
				title:       'Food Delivery Service',
				year:        2020,
				description: 'This website represents a fictional food delivery service and features a custom navigation to traverse between sections. Implementation of third-party APIs for smooth scrolling and triggering function calls from scrolled actions.'
			},
			{
				title:       'Membership Application',
				year:        2020,
				description: 'This website improves the process of joining the business club at a community college. Users complete an online application, which automatically generates a printable document required by the cashier to secure membership. Custom validation of user input ensures data integrity. Implementation of third-party APIs for masked input and PDF rendering.'
			},
			{
				title:       'Event Planning',
				year:        2020,
				description: 'This website simplifies the process of organizing a group trip to Harrison Hot Springs. An event coordinator inputs the names of all participants and from that list automatically generates a seating chart, place cards, and table numbers. Data is saved to local storage for future modifications.'
			},
			{
				title:       'Data Visualization',
				year:        2020,
				description: 'This website uses XSL to render an XML dataset as HTML table elements. Options for sorting, filtering, and paging enhance usability. Implementation of third-party API to display calculations graphically.'
			},
			{
				title:       'Leotard Orders',
				year:        2020,
				description: 'This website establishes a consistent methodology for ordering team leotards. After a customer places an order and submits design samples, the vendor is notified by email of the request. The vendor later uploads a revised version of the artwork, and an approval process ensues until the customer endorses the design. Once approved, production can begin. PHP, MySQL, JavaScript, and AJAX were applied to the gathering, processing, and storing of user data.'
			}
		],
		schools: [
			{
				name:       'Whatcom Community College',
				location:   'Bellingham, WA',
				degree:     'Certificate',
				emphasis:   'Accounting',				
				start_year: nil,
				end_year:   2016,
				online:     false
			},
			{
				name:       'Bellevue Community College',
				location:   'Bellevue, WA',
				degree:     nil,
				emphasis:   'Numerous courses in web, desktop, and database development',			
				start_year: 2001,
				end_year:   2007,
				online:     false
			},
			{
				name:       'Highline Community College',
				location:   'Des Moines, WA',
				degree:     'AAS',
				emphasis:   'Professional Secretary, Word Processing',				
				start_year: nil,
				end_year:   1993,
				online:     false
			},
			{
				name:       'Udemy',
				location:   nil,
				degree:     nil,
				emphasis:   'Numerous courses in web design and development',				
				start_year: 2017,
				end_year:   2019,
				online:     true
			},
		]
	}
]

users.each do |user|
	u = User.create!(
		name:     user[:name],
		title:    user[:title],
		password: user[:password]
	)
	
	user[:contacts].each do |contact|
		u.contacts.create!(
			title:      contact[:title], 
			value:      contact[:value]
		)
	end
	
	user[:skills].each do |skill|
		u.skills.create!(
			name: skill[:name]
		)
	end
	
	user[:jobs].each do |job|
		u.jobs.create!(
			employer:    job[:employer],
			title:       job[:title],
			start_year:  job[:start_year],
			end_year:    job[:end_year],
			location:    job[:location],
			description: job[:description]
		)		
	end
	
	user[:projects].each do |project|
		u.projects.create!(
			title:       project[:title],
			year:        project[:year],
			description: project[:description]
		)
	end
	
	user[:schools].each do |school|
		u.schools.create!(
			name:       school[:name],
			location:   school[:location],
			degree:     school[:degree],
			emphasis:   school[:emphasis],
			start_year: school[:start_year],
			end_year:   school[:end_year],
			online:     school[:online]
		)		
	end
end