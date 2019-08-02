puts "Destroy all old seeds"
Career.destroy_all
Category.destroy_all
User.destroy_all
start_time = Time.now

REVIEWS = ["I found my passion through.", "Enjoyed my time with great Professionals.", "A great experience with very knowledgeable local guides, well organised and executed.", "Amazing career", "So interesting!", "I learnt a lot about the process", "Amazing experience!", "Best experience ever!", "I really think it's an amazing career!", "I learned a lot!", "I had a wonderful experience shadowing this professional", "I absolutely love this career", "Everything went very smoothly", "It was great, fast, easy experience.", "I would recommend you guys to anyone."]

POSITIONS = ["assistant", "executive", "manager", "director", "chief", "supervisor", "coordinator", "specialist"]
CATEGORIES = [
	{
		title: "Agriculture",
		description: "A program that focuses on the general principles and practice of agricultural research and production and that may prepare individuals to apply this knowledge to the solution of practical agricultural problems. Includes instruction in basic animal, plant, and soil science; animal husbandry and plant cultivation; soil conservation; and agricultural operations such as farming, ranching, and agricultural business. Is Agriculture the right major for you?",
		image: "https://www.worldatlas.com/r/w728-h425-c728x425/upload/f2/03/7e/shutterstock-653708227.jpg"
	},
	{
		title: "Arts",
		description: "Art as a major encompasses many topics. Therefore, there is a wide range of individuals who will enjoy taking art as a major. Artistic individuals are able to draw, paint write or design are primary candidates for this major. They may also have a keen sense of music and know how to play an instrument. Hobbies for art students may involve playing music, painting, attending plays, attending the theater, analyzing movies, writing creatively, drawing, or reading.",
		image: "https://www.youth.ie/wp-content/uploads/2019/03/NYCI-Youth-Arts-2.jpg"
	},
	{
		title: "Education",
		description: "Do you love helping people and spreading knowledge? Are you passionate about a specific academic subject (or subjects)? If so, an education major might be for you.",
		image: "https://cdn.studyinternational.com/news/wp-content/uploads/2019/02/ChartervPrivate.jpg"
	},
	{
		title: "Engineering",
		description: "Combining mathematics, science and technology, engineers produce creative solutions to real world problems. ... In the past, engineering could be divided into four major branches: Mechanical, Chemical, Civil and Electrical, with sub branches of each discipline.",
		image: "https://retos-operaciones-logistica.eae.es/wp-content/uploads/2018/05/iStock-869287090-600x426.jpg"
	},
	{
		title: "Health",
		description: "A program of study that prepares individuals to assume roles as health/wellness professionals in private business and industry, community organizations, and health care settings.",
		image: "https://hhp-blog.s3.amazonaws.com/2018/02/iStock-639896942.jpg"
	},
	{
		title: "Law",
		description: "Although undergraduate majors such as political science, history, economics, communication, journalism and philosophy are traditionally associated with law school, the truth is that no single major qualifies or disqualifies a student.",
		image: "https://www.sharda.ac.in/blog/wp-content/uploads/2017/08/4-Main-Types-of-Law-Which-One-Is-the-Best-For-You.jpg"
	},
	{
		title: "Science",
		description: "Science play a major role in applying the principles and theories of science and mathematics to solve problems occurring in research and development processes. They are responsible for setting up laboratory equipment and monitoring experiments. Science technicians monitoring manufacturing processes are also required to ensure product quality by carrying out random product tests.",
		image: "https://cms.qut.edu.au/__data/assets/image/0006/776760/GettyImages-925324224.jpg"
	},
	{
		title: "Technology",
		description: "Degrees in information technology typically cover computer science and software engineering. ... There are a variety of different paths in the career field, including becoming a systems analyst, a programmer or a support specialist.",
		image: "https://sloanreview.mit.edu/content/uploads/2016/08/FR-Winston-Technology-Business-World-Challenges-1200.jpg"
	},
]
CAREERS = [
  [
    {
      title:"Agricultural Worker",
      description:"An agricultural worker is someone who works on a farm maintaining crops such as fruits, vegetables, grains, and nuts. Some agricultural workers only tend to livestock. They typically work under the supervision of an agricultural manager where they receive on-the-job training. They may work on farms of all sizes, from small, family-run businesses to large industrial agriculture operations.",
      image: "https://www.doleta.gov/naws/img/iStock-157189463.jpg",
    },
    {
      title:"Agricultural Inspector",
      description:"The job of an agricultural inspector is to evaluate and monitor that agricultural practices follow state and federal regulations regarding food safety and public health. They inspect and quantify the amount of fertilizers, pesticides or herbicides used in plantations or farms and compare it with the reference values allowed by authorities.",
      image: "https://res.cloudinary.com/hnpb47ejt/image/upload/v1547778515/wed2chgzgiehureubb1c.jpg",
    },
    {
      title:"Agrologist",
      description:"Professional agrologists are guided by a code of ethics to ensure that Canada’s agricultural and health products are of the utmost quality. The term agrologist is most often used in Canada, and the term agronomist is used in the United States. The profession of agrology focuses on science as it applies directly or indirectly to the management of resources, food production systems, food security & safety, and environmental quality.",
      image: "https://res.cloudinary.com/hnpb47ejt/image/upload/v1547856819/gswyzzcnl5skmio2nahm.jpg",
    },
    {
      title:"Agronomist",
      description:"An agronomist often acts as a liaison between the farmer and the crop researchers. He or she will review research findings and use this knowledge to help recommend solutions to farmers. Suggestions are made to the farmer regarding new scientific developments in order to help the growing operation.",
      image: "https://res.cloudinary.com/hnpb47ejt/image/upload/v1547857044/foikx6eok1x1hgrgvqw6.jpg"
    },

    {
      title:"Conservation Scientist",
      description:"A conservation scientist is someone who manages the overall land quality of forests, parks, rangelands, and other natural resources. They work with landowners and all levels of government to devise ways to use and improve the land while safeguarding the environment. They advise farmers, farm managers, and ranchers on how they can improve their land for agricultural purposes and to help control erosion.",
      image: "https://res.cloudinary.com/hnpb47ejt/image/upload/v1544491110/rs7qdbrgyiqfwxzrolto.jpg",

    },
    {
      title:"Dairy Farmer",
      description:"A dairy farmer is someone who owns or manages a farm where cows are raised for the production of milk and other dairy products. These farmers are involved in a wide range of activities for the purpose of increasing milk production. Milk which is produced on these farms is sold commercially to regional dairy companies for pasteurization and processing.",
      image: "https://res.cloudinary.com/hnpb47ejt/image/upload/v1543951585/igcasgqqk7l4qyraief9.jpg",
    },
    {
      title:"Farm Equipment Mechanic",
      description:"A farm equipment mechanic is a highly skilled and trained technician who is called in by farmers and farm equipment dealers to perform repairs and regular maintenance on large and expensive pieces of machinery. As modern farms have grown in size, their need for complex machines capable of working hundreds of acres has grown as well. No longer working with just a simple till, modern farmers employ multiple tractors, each equipped with up to four hundred horse-powered engines. Along with large tractors, there are other expensive, complex machines like irrigation systems, combines, hay balers and many more.",
      image: "https://res.cloudinary.com/hnpb47ejt/image/upload/v1542145671/xfafyhaaish0wssmjbgc.jpg",
    }
  ],
  [
    {
      title:"Photographer",
      description:"Photographers are artists with the camera, using a blend of technical skills and an artistic eye to take pictures of people, places, landscapes, food, you name it. Photographers can work as fine artists, wedding and event photographers, or sell their photos to commercial clients.",
      image: "https://www.simplybusiness.co.uk/media/articles/2018/08/how-to-become-a-freelance-photographer.jpg",
    },

    {
      title:"Actor",
      description:"An actor is someone who plays a character in a film, television, radio, or theatre production. When most people think of actors they think of Hollywood actors who perform in blockbuster films, and this is often the ultimate aspiration of anyone dreaming of a career in acting. It is difficult to achieve a high level of success in the field of acting; the majority of actors perform in smaller productions, often starting out in advertisements or as extras on television shows or films.",
      image: "https://res.cloudinary.com/hnpb47ejt/image/upload/v1547151996/xjgb7gtjipnpebb5byn9.jpg"
    },
    {
      title:"Choreographer",
      description:"Choreographers create routines for individual performers, competitions, musical performances, marching bands, ballets and other spectacles. They create dance and movement routines, sometimes by revising or combining existing routines.",
      image: "https://www.yourfreecareertest.com/wp-content/uploads/2017/05/choreographer.jpg"
    },
    {
      title:"Model",
      description:"Fashion models represent brands and designers by wearing their clothing and accessories in photo shoots, commercials, and runway shows. This role typically requires both physical attractiveness and the ability to maintain an elegant and graceful appearance through long hours.",
      image: "https://cf.ltkcdn.net/fashion-history/images/std/214303-675x450-fashionmodel.jpg"
    },
    {
      title:"Fashion Designer",
      description:"A Fashion Designer designs and assists with the production of clothing, shoes and accessories, identifies trends, and selects styles, fabrics, colors, prints and trims for a collection. Fashion Designers either design haute couture or ready-to-wear clothing.",
      image: "https://greatdress.uk/wp-content/uploads/2018/10/fashiondesigner.jpg"
    },
    {
      title:"Interior Designer",
      description:"Interior designers make interior spaces functional, safe, and beautiful by determining space requirements and selecting decorative items, such as colors, lighting, and materials. They read blueprints and must be aware of building codes and inspection regulations.",
      image: "https://www.rmcad.edu/wp-content/uploads/2018/06/InteriorDesignBlog.png"
    },
    {
      title:"Graphic Designer",
      description:"Prepares work to be accomplished by gathering information and materials. Plans concept by studying information and materials. Illustrates concept by designing rough layout of art and copy regarding arrangement, size, type size and style, and related aesthetic concepts.",
      image: "https://pictures.ozy.com/pictures/600x337/9/1/9/137919_shutterstock_445337599.jpg"
    },
    {
      title:"Acrobat",
      description:"Entertains audience by performing difficult and spectacular feats, such as leaping, tumbling, and balancing, alone or as member of team",
      image: "https://static1.squarespace.com/static/58a99a52893fc06cb7156c62/t/5a31170f53450a14f5a2a836/1513166608835/B31A5499a.jpeg?format=2500w"
    },
    {
      title:"Announcer",
      description:"An announcer is someone who presents music, news, and/or sports and may provide commentary, or interview guests, about these topics. Some act as a master of ceremonies (emcee) or disc jockey (DJ) at weddings, parties, or clubs. Many announcers work in radio and television studios. Others work for sports teams or are self-employed.",
      image: "https://res.cloudinary.com/hnpb47ejt/image/upload/v1548100404/qdace2wip1uslubnabgl.jpg"
    },
    {
      title:"Digital Designer",
      description:"Work with artists and illustrators to produce digital animation for various projects, such as websites, online magazines, advertisement materials, and videos. They are usually responsible for creating templates and mock-ups to review with artists and management before submitting the finished product.",
      image: "https://creativebeacon.com/wp-content/uploads/2017/08/digital-designer.jpg"
    }
  ],
  [
    {
      title:"Career Counselor",
      description:"Use aptitude and achievement assessments, to help clients evaluate their interests, skills, and abilities. Evaluate clients' background, education, and training, to help them develop realistic goals. ... Help clients learn job search skills, such as interviewing and networking.",
      image: "https://www.naceweb.org/uploadedImages/images/2017/feature/infusing-career-counseling-with-academic-advising.jpg"
    },
    {
      title:"Art Teacher",
      description:"Work in school and community settings, instructing students in the basic principles of art and art history. ... Art teachers supervise and assist students, grade artwork, encourage creativity, and teach techniques in a variety of mediums.",
      image: "https://qo1woxfbaw84ufi8-zippykid.netdna-ssl.com/wp-content/uploads/2018/04/high-school-art-teacher.jpg"
    },
    {
      title:"Childcare Program Administrator",
      description:"Child daycare administrators oversee the business management, finances and budgets of childcare facilities. Administrators supervise the childcare workers and pre-school teachers and ensure the facility's staff meets state requirements for education and training.",
      image: "https://centarzalicnirazvoj.com/media/2018/12/De%C4%8Dije-potrebe-2.jpg"
    },
    {
      title:"Childcare Worker",
      description:"Supervise and monitor the safety of children in their care. Prepare meals and organize mealtimes and snacks for children. ... Develop schedules and routines to ensure that children have enough physical activity, rest, and playtime.",
      image: "https://www.thedailyslog.com/wp-content/uploads/2018/07/childcare-workers-938x489.jpg"
    },
    {
      title:"Elementary School Teacher",
      description:"Prepare younger students for future education by teaching them vital subjects, such as reading, science and mathematics. ... They develop and enforce classroom rules to teach proper behavior.",
      image: "https://magoosh.com/praxis/files/2016/10/shutterstock_309241625.jpg"
    },
    {
      title:"Graduate Teaching Assistant",
      description:"Assist faculty or other instructional staff in postsecondary institutions by performing teaching or teaching-related duties, such as teaching lower level courses, developing teaching materials, preparing and giving examinations, and grading examinations or papers.",
      image: "https://www.thoughtco.com/thmb/2ggG64ZZF05Qh8gQe8XTXqLEP-U=/768x0/filters:no_upscale():max_bytes(150000):strip_icc()/200290882-001-56a18eaf3df78cf7726bff8c.jpg"
    }
  ],
  [
    {
      title:"Aerospace Engineer",
      description:"Aerospace engineers use advanced education and experience in mechanical, electrical, materials or computer engineering disciplines to plan and construct spacecraft and aircraft. When dealing with spacecraft, these professionals are called astronautical engineers.",
      image: "https://www.economist.com/sites/default/files/images/print-edition/20180324_WBP001_0.jpg"
    },
    {
      title:"Agricultural Engineer",
      description:"Apply knowledge of engineering technology and biological science to agricultural problems concerned with power and machinery, electrification, structures, soil and water conservation, and processing of agricultural products.",
      image: "https://media.istockphoto.com/photos/agricultural-engineer-examining-lettuce-picture-id950850392"
    },
    {
      title:"Biochemical Engineer",
      description:"Biochemical Engineers develop usable, tangible products, using knowledge of biology, chemistry, or engineering. Solve problems related to materials, systems, or processes that interact with humans, plants, animals, microorganisms, or biological materials.",
      image: "https://www.cpjobs.com/hk/sites/default/files/styles/large/public/photos/content/855x420_fb_feed_20180114.jpg?itok=yA-9LWi1"
    },
    {
      title:"Chemical Engineer",
      description:"Chemical engineers develop and design chemical manufacturing processes. Chemical engineers apply the principles of chemistry, biology, physics, and math to solve problems that involve the production or use of chemicals, fuel, drugs, food, and many other products.",
      image: "https://www.cpjobs.com/hk/sites/default/files/styles/large/public/photos/content/855x420_fb_feed_20180114.jpg?itok=yA-9LWi1"
    },
    {
      title:"Biofuel Manufacturing Research Engineer",
      description:"They assess the existing equipment used, review the process and then refine that process or create a new process. Part of their objective is to make biofuel production as effective and cost-efficient as possible.",
      image: "https://www.birmingham.ac.uk/Images/Research-and-teaching/Engineering-and-Physical-Sciences/eps/college/research/engines-of-the-future.jpg"
    },
    {
      title:"Computer Hardware Engineer",
      description:"Responsible for designing, developing, and testing computer hardware, including computer systems, circuit boards, computer chips, keyboards, routers, and printers. Supervises the manufacturing, production, and installation of the parts.",
      image: "https://c3.dq1.me/uploads/article/53156/computer_20hardware_20engineer_20soldering_20circuit_20board_202.jpg"
    },
    {
      title:"Electrical Engineer",
      description:"Electrical engineers design, develop, and test electrical devices and equipment, including communications systems, power generators, motors and navigation systems, and electrical systems for automobiles and aircraft. They also oversee the manufacture of these devices, systems, and equipment.",
      image: "https://www.careermatch.com/job-prep/wp-content/uploads/sites/29/2018/02/electrical_engineer_resume_cover_letter.jpg"
    },
    {
      title:"Environmental Engineer",
      description:"Environmental engineers use the principles of engineering, soil science, biology, and chemistry to develop solutions to environmental problems. They are involved in efforts to improve recycling, waste disposal, public health, and water and air pollution control.",
      image: "http://www.stemjobs.com/wp-content/uploads/2016/11/TS_Environmental-Engineer.jpg"
    },
    {
      title:"Explosives Worker",
      description:"Place and detonate explosives to demolish structures or to loosen, remove, or displace earth, rock, or other materials. May perform specialized handling, storage, and accounting procedures. Includes seismograph shooters.",
      image: "https://www.convergencetraining.com/videos/newvids/commercial-explosives-safety-Full.jpg"
    }
  ],
  [
    {
      title:"Doctor",
      description:"Medical Doctors perform health assessments, run diagnostic tests, prescribe medication, create treatment plans and provide health and wellness advice to patients. Medical Doctors can specialize in specific areas of health, such as dermatology, neurology, gastroenterology or gynecology.",
      image: "https://i2-prod.mirror.co.uk/interactives/article12645227.ece/ALTERNATES/s615/doctor.jpg"
    },
    {
      title:"Cardiothoracic Surgeon",
      description:"A cardiothoracic surgeon is a medical doctor who specializes in surgical procedures of the heart, lungs, esophagus, and other organs in the chest. This includes surgeons who can be called cardiac surgeons, cardiovascular surgeons, general thoracic surgeons, and congenital heart surgeons.",
      image: "https://intermountainhealthcare.org/-/media/images/modules/blog/posts/2018/01/choosing-a-pediatric-heart-surgeon.jpg?mw=476"
    },
    {
      title:"Clinical Psychologist",
      description:"A clinical psychologist is a mental health professional with highly specialized training in the diagnosis and psychological treatment of mental, behavioral and emotional illnesses, including obsessive-compulsive disorder (OCD).",
      image: "https://www.psychologycareercenter.org/wp-content/uploads/2014/11/clinical-psychologist-meeting-with-a-client.jpg"
    },
    {
      title:"Dental Assistant",
      description:"A clinical psychologist is a mental health professional with highly specialized training in the diagnosis and psychological treatment of mental, behavioral and emotional illnesses, including obsessive-compulsive disorder (OCD).",
      image: "https://www.lwtech.edu/academics/dental-assistant/images/lwtech-dental-assisting.jpg"
    },
    {
      title:"Dermatologist",
      description:"Dermatologists are doctors of the skin, which is the largest organ of the human body. ... They also treat serious skin conditions, such as skin cancer. All in all, dermatologists treat more than 3,000 diseases.",
      image: "https://wp02-media.cdn.ihealthspot.com/wp-content/uploads/sites/110/2018/04/02212207/dermatologyappointment.jpg"
    },
    {
      title:"Anesthesiologist",
      description:"Responsible for handling surgical patients and their pain relief during procedures. During surgery, anesthesiologists administer anesthetics (drugs) and adjust them as needed, and they also monitor patients' vital signs.",
      image: "https://www.careergirls.org/wp-content/uploads/2018/05/Anesthesiologist_1920x1080.jpg"
    },
    {
      title:"Medical Secretary",
      description:"Perform secretarial duties utilizing specific knowledge of medical terminology and hospital, clinic, or laboratory procedures. Duties include scheduling appointments, billing patients, and compiling and recording medical charts, reports, and correspondence.",
      image: "https://coursegate.co.uk/wp-content/uploads/2018/09/12-Medical-Secretary-Certificate.jpg"
    },
    { title:"Endocrinologist",
      description:"Treats patients having diseases related to hormones and the endocrinal glands. Common disorders that an endocrinologist treats are: thyroid abnormalities, diabetes, hypertension, infertility, cholesterol disorders, and cancers in the endocrinal glands.",
      image: "http://lovelace.com/sites/default/files/iStock_28267926_MEDIUM.jpg"
    },
    {
      title:"Medical Assistant",
      description:"Clinical duties vary according to state law and include: taking medical histories and recording vital signs, explaining treatment procedures to patients, preparing patients for examination, and assisting the physician during the examination.",
      image: "https://cdn.careeronestop.org/OccVids/OccupationVideos/31-9092.00.jpg"
    }
  ],
  [
    { title:"Lawyer",
      description:"Also called an attorney or counselor—or a solicitor or barrister in parts of Europe—a lawyer advocates for their clients' rights. They may do this through negotiation with other parties to a lawsuit or through litigation. They effectively steer the ship. The failure or success of a firm begins with the abilities of its lawyers.",
      image: "https://image.shutterstock.com/image-photo/judge-gavel-justice-lawyers-businessman-260nw-1092414422.jpg"
    },
    { title:"Paralegal",
      description:"This person serves as the lawyer's right hand. A paralegal takes over certain tasks to free up the attorney's time so he can take care of things that only an attorney can do, such as appear in court or give legal advice. Paralegals may draft pleadings, assist clients, and do legal research under the supervision of the attorney.",
      image: "https://res.cloudinary.com/highereducation/image/upload/w_740,h_416,c_fill,f_auto,fl_lossy,q_auto/v1/TheBestSchools.org/online-bachelors-paralegal-hero.jpg"
    },
    { title:"Legal Secretary",
      description:"Also called an administrative assistant, this position entails less responsibility than a paralegal but often more than the average secretarial role. Responsibilities include the normal sphere of secretarial duties in addition to things like file maintenance and drafting basic correspondence, such as letters to clients notifying them of upcoming court dates.",
      image: "https://image.freepik.com/free-photo/secretary-holding-pen_1098-3215.jpg"
    },
    { title:"Legal Recruiter",
      description:"This position does not involve working within a law firm. A legal recruiter provides their clients—typically law firms—with potential employees. Those employees are usually attorneys but sometimes paralegals as well. A Juris Doctor degree may be required.",
      image: "http://myfreshstartlawyer.com/wp-content/uploads/2018/03/legal-recruiter.jpg"
    },
    {
      title:"Mediator",
      description:"Also called an arbitrator or conciliator, a mediator handles alternative dispute resolution (ADR), which many states require before a civil lawsuit can proceed to trial. The mediator meets with and attempts to guide opposing parties to compromise or settlement. They don't 'represent' either side and may or may not be an employee of the government.",
      image: "https://www.disputescentre.com.au/wp-content/uploads/2018/11/Mediation_Training_Pic-01.jpg"
    },
    { title:"Forensic Scientist",
      description:"A forensic scientist helps to collect, preserve, and analyze physical evidence for attorneys and the courts. A blood spatter analyst is one example.",
      image: "http://spectroline.com/wp-content/uploads/2016/06/Forensics-Ultraviolet-Inspection.jpg"
    },
    {
      title:"Contract Administrator",
      description:"This individual typically works under the practice administrator dealing with specific areas of day-to-day finances, particularly those involving contractual obligations.",
      image: "https://www.shada.com.au/images/Occupations/STSOL/Contract_Administrator.jpg"
    },
    {
      title:"Court Interpreter",
      description:"A court interpreter assists non-English-speaking litigants. ",
      image: "https://careertraining.ed2go.com/common/images/1/17750/interpreter-court-translator.jpg"
    },
    {
      title:"Computer Forensics Professional",
      description:"This professional analyzes digital evidence and reports on it. They may also testify regarding it at trial. Think of a hard drive that's been intentionally erased, but some trace of data remains behind. The computer forensics professional would unearth that.",
      image: "https://staticx.kashmirobserver.in/assets/container/media/article-images/2018/51/computer-surveillance.jpg"
    }
  ],
  [
    {
      title:"Biologist",
      description:"Field biologists can work in many different areas. ... They often have to live and work outdoors as they perform field research and collect biological data. Some field biologists specialize in the study of aquatic plant and animal life.",
      image: "https://image.shutterstock.com/image-photo/biologist-her-laboratory-260nw-789842305.jpg"
    },
    {
      title:"Computer Scientist",
      description:"Also called computer and information scientists, can work for government agencies and private software publishers, engineering firms or academic institutions. Businesses and government agencies usually employ these scientists to develop new products or solve computing problems.",
      image: "https://www.bestvalueschools.com/wp-content/uploads/2016/02/what-is-the-employment-outlook-for-computer-science.jpg"
    },
    {
      title:"Geneticist",
      description:"Research laboratories employ scientists to understand gene behavior, gene duplication, physical characteristics and diseases. ... Genetic scientists in a clinical setting use their knowledge to guide and treat patients with hereditary diseases or disorders.",
      image: "https://conceptodefinicion.de/wp-content/uploads/2011/03/Gen%C3%A9tica-2.jpg"
    },
    {
      title:"Marine Biologist",
      description:"Research the sea and study its interactions with its organisms, sea floors, coastal areas and the atmosphere. Marine science is a broad discipline, so many choose to specialise in a particular field such as a particular species.",
      image: "https://www.careermatch.com/job-prep/wp-content/uploads/sites/29/2017/11/marine-biologist_profile_image.jpg"
    },
    {
      title:"Chemist",
      description:"Searches for new knowledge about chemicals and uses it to improve the way we live. He or she may develop products such as synthetic fibers, drugs, and cosmetics. Chemists create processes, including oil refining and petrochemical processing, that reduce energy use and pollution.",
      image: "https://www.pharmaceutical.ca/content/uploads/2017/08/CHEMIST-JOB-DESCRIPTION.jpg"
    },
    {
      title:"Meteorologist",
      description:"Study the earth's atmosphere – particularly climate and weather – in order to forecast weather conditions. The main duties of meteorologists include: recording and analysing data from worldwide weather stations, satellites, radars and remote sensors.",
      image: "https://www.uu.se/digitalAssets/666/c_666342-l_3-k_image.jpg"
    },
    {
      title:"Physicist",
      description:"Physicists are highly trained scientists who study matter and the universe. They measure and study phenomena from the subatomic to the cosmic level and then use or develop models and theories to explain their observances. ... You may take part in direct testing or observe properties of matter.",
      image: "http://i0.wp.com/www.owlguru.com/wp-content/uploads/wpallimport/files/Physicists/__(4).jpg"
    },
    {
      title:"Microbiologist",
      description:"Microbiologists study microorganisms such as bacteria, viruses, algae, fungi, and some types of parasites. They try to understand how these organisms live, grow, and interact with their environments.",
      image: "https://www.wur.nl/upload_mm/7/7/7/db7c9636-4a40-4ebb-86ba-8566d9fc7dd2_website%20plaatje_aea1aa27_740x360.jpg"
    },
    {
      title:"Geologist",
      description:"Studies the composition, structure, and other physical attributes of the earth, including rocks and minerals. They use physics, mathematics, and geological knowledge in exploration for oil, gas, minerals, or underground water.",
      image: "https://www.abdn.ac.uk/study/images/prospectus/11901-12000/11931/12_BSc_GPG_top_image_1.png"
    }
  ],
  [
    {
      title:"Systems Analyst",
      description:"Computer systems analysts assist businesses with solving their computer needs. After assessing the requirements of the business and the resources available, they plan computer systems and networks tailored to serve the business' unique interests. This may include modifying existing software or creating new software to manage company functions. Many systems analysts stay competitive by specializing in computer systems that correlate to one particular area of employment, such as accounting and financial systems.",
      image: "https://i.ytimg.com/vi/T0JdNufvn-o/maxresdefault.jpg"
    },
    {
      title:"Computer Support Specialist",
      description:"A computer support specialist provides technical assistance to many different types of organizations, including schools, government agencies and private sector businesses. Commonly, a computer support specialist will work in a help-desk service area or a call center work environment. The main duty of a computer support specialist is to respond to technical issues called in by a user or submitted by e-mail. They may guide the user through fixing the problem, run automatic software diagnostics to assess and fix the issue, or send a specialist to fix it on-site.",
      image: "https://www.bls.gov/ooh/images/1799.jpg"
    },
    {
      title:"Business Analyst",
      description:"Business analysts examine an organisation (or part of a business) to determine how to better achieve goals. Almost always, there's a strong information technology component. That's because IT is integral to modern business operations. For example, analysts may scope out the potential effects of changing computer software. Analysts need to be adaptable because job requirements vary from company to company. To become a business analyst, you’ll probably need to obtain an entry-level position in the field and build a career from there. Business education in addition to advanced IT training confers an advantage.",
      image: "https://c3.dq1.me/uploads/article/54700/analyst-working-computer.jpg"
    },
    {
      title:"Computer Service Technician",
      description:"Computer service technicians (also referred to as computer repair technicians) repair computer hardware and software. Some of the common tasks are replacing defective components, removing spyware and viruses, dissembling hardware, and running diagnostic tests. If a job in this field is your goal, start getting as much experience as you can in assembling and repairing computers. CompTIA A+ certification is a helpful qualification. Also consider completing a program at a tech school or college.",
      image: "http://www.njbusinessreview.com/wp-content/uploads/2015/01/nj-computer-technician.jpg"
    },
    {
      title:"Database Administrator",
      description:"Database administrators (DBAs) handle database security, integrity, and performance. They ensure data standards are consistent, data is accessible by users as needed, and they solve any problems encountered by users. These professionals might also be involved in database planning and development. A degree in an IT-related field is usually required and it’s useful to have programming experience. Experienced DBAs have strong applied knowledge of database operating systems and technologies.",
      image: "https://rismedia.com/wp-content/uploads/2019/04/database_923752568-1080x627.jpg"
    },
    {
      title:"Hardware Engineer",
      description:"Hardware engineers (also referred to as computer hardware engineers) oversee the manufacture and installation of computer systems, servers, circuit boards, and chips, as well as the testing of equipment. They also work with routers, printers, and keyboards. People wanting a career in this lucrative field require a degree in computer engineering. Depending on the employer, a degree in electrical engineering or computer science might be an acceptable alternative. Creativity and good communications skills are useful complements to technical skills.",
      image: "https://www.online.colostate.edu/global/images/certificates/computer-systems-engineering-certificate_1200.jpg"
    },
    {
      title:"Multimedia Developer",
      description:"Multimedia developers are skilled in computer programming and visual artistry. They design software and create multimedia applications by generating and manipulating animations, graphic images, text, sound, and video. Some examples of applications include multimedia presentations, educational and entertainment products, and computer-based interactive training. You might consider this career if you’re an IT-graduate strong in visual arts. While a degree is useful, many people also start work in the field with only a relevant certificate.",
      image: "https://www.elsiglodetorreon.com.mx/m/i/2018/03/1036585.jpeg"
    },
    {
      title:"Software Engineer",
      description:"While software developers design applications, it’s programmers who write the code needed for programs to function. Programmers also test software and update existing software. Many are employed by software companies. Necessary soft skills include problem solving, reading comprehension, active listening, attention to detail, and critical thinking. You might consider entering this field if you enjoy working with code for extended periods and testing the power of programming languages. As experience is an important asset, it’s helpful to do an internship or gain other hands-on experience while completing your formal education.",
      image: "https://blog.uwohoo.com/wp-content/uploads/2019/03/Good-programmer.jpeg"
    },
  ]
]


def faker_male
  Faker::Name.male_first_name
end

def faker_female
  Faker::Name.female_first_name
end
## CREATE PRO USER
def create_user(career)
  2.times do

    male_user = User.new(
      user_type: 1,
      account_status: 1,
      first_name: faker_male.split.first,
      last_name: Faker::Name.last_name,
      birth: (Date.today - (365 * rand(25..50))),
      user_description: Faker::Company.name + " " + Faker::Company.industry + " " + POSITIONS.sample.capitalize,
        # user_description: Faker::Educator.university + ", " + Faker::Educator.degree,
        photo: "https://randomuser.me/api/portraits/men/#{rand(1..99)}.jpg",
        password: 123456
        )
    male_user.email = male_user.first_name.downcase + male_user.last_name.downcase + rand(80..89).to_s + "@mail.com"
    # puts male_user.first_name
    # puts male_user.last_name
    # puts male_user.email
    # puts male_user.user_description
    # puts male_user.photo
    male_user.save!

    create_professional(male_user, career)

    fem_user = User.new(
      user_type: 1,
      account_status: 1,
      first_name: faker_female.split.first,
      last_name: Faker::Name.last_name,
      birth: (Date.today - (365 * rand(25..50))),
      user_description: Faker::Company.name + " " + Faker::Company.industry + " " + POSITIONS.sample.capitalize,
        # user_description: Faker::Educator.university + ", " + Faker::Educator.degree,
        photo: "https://randomuser.me/api/portraits/women/#{rand(1..99)}.jpg",
        password: 123456
        )
    fem_user.email = fem_user.first_name.downcase + fem_user.last_name.downcase + rand(80..89).to_s + "@mail.com"
    # puts fem_user.first_name
    # puts fem_user.last_name
    # puts fem_user.email
    # puts fem_user.user_description
    # puts fem_user.photo

    fem_user.save!

    create_professional(fem_user, career)
  end
end

def create_review(booking, student)
  review = Review.new(
    content: REVIEWS.sample,
    user: student,
    booking: booking,
    rating: rand(3..5)
    )
  review.save
  # puts "Review for #{booking.professional.user.first_name} #{booking.professional.user.last_name} by #{booking.user.first_name} #{booking.user.last_name}: #{review.content} Rating: #{review.rating}"
end

## CREATE BOOKING
def create_booking(professional, student)
  start = Faker::Date.forward(rand(2..20))
  ending = start + rand(7..20)
  booking = Booking.new(
    professional: professional,
    start_book: start,
    end_book: ending,
    amount_of_days: (ending - start).round,
    booking_status: rand(0..2),
    intro_message: "I'm insterested on " + professional.career.title + " career."
    )
  booking.user = student
  booking.save
  # puts "#{booking.user.first_name} #{booking.user.last_name} booked #{booking.professional.user.first_name} #{booking.professional.user.last_name}"
  create_review(booking, student)

end


## CREATE STUDENT USER
def create_student_user(professional)
  2.times do
    fem_student = User.new(
      user_type: 0,
      account_status: 1,
      first_name: Faker::Name.female_first_name,
      last_name: Faker::Name.last_name,
      birth: Faker::Date.backward(365 * rand(15..20)),
      user_description: Faker::Nation.nationality + ", " + Faker::Educator.secondary_school + " student.",
      password: 123456,
      photo: "https://randomuser.me/api/portraits/women/#{rand(1..99)}.jpg"
      )
    fem_student.email = fem_student.first_name.downcase + fem_student.last_name.downcase + rand(90..99).to_s + "@mail.com"
    fem_student.save
    puts "Creating account for #{fem_student.first_name} #{fem_student.last_name}"
    create_booking(professional, fem_student)


    male_student = User.new(
      user_type: 0,
      account_status: 1,
      first_name: Faker::Name.male_first_name,
      last_name: Faker::Name.last_name,
      birth: Faker::Date.backward(365 * rand(15..20)),
      user_description: Faker::Nation.nationality + ", " + Faker::Educator.secondary_school + " student.",
      password: 123456,
      photo: "https://randomuser.me/api/portraits/women/#{rand(1..99)}.jpg"
      )
    male_student.email = male_student.first_name.downcase + male_student.last_name.downcase + rand(90..99).to_s + "@mail.com"
    male_student.save
    # puts "Creating account for #{male_student.first_name} #{male_student.last_name}"

    create_booking(professional, male_student)

  end
end

## CREATE PROFESSOINAL CARD
def create_professional(user, career)
  address = Faker::Address.full_address
  pro = Professional.new(
    address: address,
    location: address.split(", ")[1],
    specialty: Faker::Educator.university + " " + career.title,
    experience_in_years: rand(5..10),
    resume: career.description,
    company_logo: Faker::Company.logo
    )
  # puts "CREATING PROFESSIONAL"
  pro.user = user
  # puts "Location: #{pro.location}"
  # puts "#{pro.experience_in_years} years of experience"
  # puts "Resume #{pro.resume}"
  # puts "Company logo: #{pro.company_logo}"
  # puts "Specialty #{pro.specialty}"
  pro.career = career

  pro.save!
  create_student_user(pro)
end

puts "CREATE CATEGORIES"


## CREATE CATEGORIES
CATEGORIES.each_with_index do |category, index|

  puts ""
  c = Category.new(category)
  c.save!
  puts " - created Category: #{c.title}"


  # CREATE CAREERS
  CAREERS[index].each do |career|
    car = Career.new(career)
    car.category = c
    car.save!

    puts "   - added Career: #{car.title}"
    create_user(car)
    create_user(car)
    puts "-------------------"
  end
  puts ""

end

# User
# Professional
# career = Career
# Category
# Review
# Booking
# Message
# ## ---------------------------------
## ---------------------------------

# https://randomuser.me/api/portraits/med/women/99.jpg
# https://randomuser.me/api/portraits/med/men/99.jpg






my_user = User.new(
  email: "lux@mail.com",
  user_type: 1,
  account_status: 1,
  first_name: "Lux",
  last_name: "Le Wagon",
  birth: Faker::Date.backward(365 * 25),
  user_description: "Ruby Fullstack Developer - Argentina",
  photo: "https://avatars1.githubusercontent.com/u/46462316?v=4",
  password: 123456
  )
my_user.save!
pro = Professional.new(
  address: "Niceto Vegas 4866",
  location: "Argentina, Buenos Aires",
  specialty: "Ruby Fullstack Developer - Le Wagon",
  experience_in_years: 2,
  resume: "Change your life, learn to code.",
  company_logo: "https://dwj199mwkel52.cloudfront.net/assets/lewagon-logo-square-fe76916e1b923ade71e253ae6dc031d936e5e8eebac4e26b0fbac650ea6ee360.png",
  career: Career.all.last,
  user: my_user
  )
# puts "CREATING PROFESSIONAL FOR TESTING"
pro.save!
10.times do
  create_booking(pro, User.all.sample)
end


Professional.all.each do |pro|
  5.times do
    start = Faker::Date.backward(rand(20..100))
    ending = start + rand(7..19)
    booking = Booking.new(
      professional: pro,
      start_book: start,
      end_book: ending,
      amount_of_days: (ending - start).round,
      booking_status: rand(1..2),
      intro_message: "I'm insterested on " + pro.career.title + " career."

      )
    booking.user = User.where(user_type: 0).sample
    booking.save
    # puts "#{booking.user.first_name} #{booking.user.last_name} booked #{booking.professional.user.first_name} #{booking.professional.user.last_name}"
    create_review(booking, User.all.sample)
  end
end

puts "Finished seeding process"
end_time = Time.now
result = end_time - start_time

puts "#{result} seconds"
