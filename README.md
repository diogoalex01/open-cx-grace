# Grace Development Report

Welcome to the documentation pages of the **Grace**!

You can find here detailed information about the (sub)product, hereby mentioned as "module", from a high-level vision to low-level implementation decisions, a kind of Software Development Report (see [template](https://github.com/softeng-feup/open-cx/blob/master/docs/templates/Development-Report.md)), organized by discipline (as of RUP): 

* Business modeling 
  * [Product Vision](#Product-Vision)
  * [Elevator Pitch](#Elevator-Pitch)
* Requirements
  * [Use Case Diagram](#Use-case-diagram)
  * [User stories](#User-stories)
  * [Domain model](#Domain-model)
* Architecture and Design
  * [Logical architecture](#Logical-architecture)
  * [Physical architecture](#Physical-architecture)
  * [Prototype](#Prototype)
* [Implementation](#Implementation)
* [Test](#Test)
* [Configuration and change management](#Configuration-and-change-management)
* [Project management](#Project-management)

So far, contributions are exclusively made by the initial team, but we hope to open them to the community, in all areas and topics: requirements, technologies, development, experimentation, testing, etc.

**Please contact us!
Thank you!** :relaxed:

Mafalda Santos<br>
Diogo Silva<br>
Liliana Almeida<br>
João Luz

---

## Product Vision
[comment]: <> (É um assistente para te orientar durante a conferência. Tem ainda a valência de servir como animador entre eventos para tornar a tua experiência realmente memorável!)

**Grace** is an assistant to guide you throughout the conference. Besides that, it can act as a host and entertainer between events to make your experience truly memorable!

 ---
## Elevator Pitch

* **To Do**

[comment]: <> (Draft a small text to help you quickly introduce and describe your product in a short time and a few words '~800 characters', a technique usually known as elevator pitch. Take a look at the following links to learn some techniques: [Crafting an Elevator Pitch]'https://www.mindtools.com/pages/article/elevator-pitch.htm' [The Best Elevator Pitch Examples, Templates, and Tactics - A Guide to Writing an Unforgettable Elevator Speech, by strategypeak.com]'https://strategypeak.com/elevator-pitch-examples/' [Top 7 Killer Elevator Pitch Examples, by toggl.com]'https://blog.toggl.com/elevator-pitch-examples/')

---

## Requirements

[comment]: <> (In this section, you should describe all kinds of requirements for your module: functional and non-functional requirements.)

[comment]: <> (Start by contextualizing your module, describing the main concepts, terms, roles, scope and boundaries of the application domain addressed by the project.)

The app should be able to provide a fully functional interface to remotely control the assistant. It should also allow the **administrator** - who controls it - to see its surroundings using **GraceVision**. The **conference participant** can use the app to summon Grace.

### Use Case Diagram

![Use Case Diagram][use case diagram]

[comment]: <> (Create a use-case diagram in UML with all high-level use cases possibly addressed by your module.Give each use case a concise, results-oriented name. Use cases should reflect the tasks the user needs to be able to accomplish using the system. Include an action verb and a noun. Briefly describe each use case mentioning the following:)

[comment]: <> (Name Actor: Name only the actor that will be initiating this use case, i.e. a person or other entity external to the software system being specified who interacts with the system and performs use cases to accomplish tasks.)

[comment]: <> (Description: Provide a brief description of the reason for and outcome of this use case, or a high-level description of the sequence of actions and the outcome of executing the use case.)

[comment]: <> (Preconditions and Postconditions. Include any activities that must take place, or any conditions that must be true, before the use case can be started 'preconditions' and postconditions. Describe also the state of the system at the conclusion of the use case execution 'postconditions'.)

[comment]: <> (Normal Flow. Provide a detailed description of the user actions and system responses that will take place during execution of the use case under normal, expected conditions. This dialog sequence will ultimately lead to accomplishing the goal stated in the use case name and description. This is best done as a numbered list of actions performed by the actor, alternating with responses provided by the system.)

[comment]: <> (Alternative Flows and Exceptions. Document other, legitimate usage scenarios that can take place within this use case, stating any differences in the sequence of steps that take place. In addition, describe any anticipated error conditions that could occur during execution of the use case, and define how the system is to respond to those conditions.)

#### Summon Grace
* **Actor**: Conference Paticipant.

* **Description**: Participant pushes a button that summons Grace, making it go meet the former.

* **Preconditions and Postconditions**: For Grace to meet the summoner, it can't be busy responding to other user requests.

* **Normal Flow**: <br>
&nbsp; 1. **User**: pushes button. <br>
&nbsp; 2. **System**: gets the request and replies with a confirmation that Grace is on its way. <br>
&nbsp; 3. **User**: gets the feedback. <br>
&nbsp; 4. **System**: sends Grace. <br>
&nbsp; 5. **User**: meets Grace.

* **Alternative Flows and Exceptions**: <br>
&nbsp; 1. **User**: pushes button. <br>
&nbsp; 2. **System**: gets the request and replies with a confirmation that Grace is on its way. <br>
&nbsp; 3. **User**: gets the feedback. <br>
&nbsp; 4. **System**: sends Grace. <br>
&nbsp; 5. **User**: cancels the request. <br>
&nbsp; 6. **System**: receives the request and sends Grace back.

&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; If Grace is unavailable, the system sends feedback accordingly and the user is put on a waiting list.

#### Move Grace Around Manually
* **Actor**: Robot Controller.

* **Description**: The controller has two input methods at their disposal - a joystick and a slider - to manipulate the direction and speed of Grace, respectively. Optionally, they can toggle **GraceVision** ON or OFF, allowing them to visualize Grace's route.

* **Preconditions and Postconditions**: Grace has to be set to "Manual Mode" beforehand.

* **Normal Flow**: <br>
&nbsp; 1. **Admin**: moves the joystick in the intended direction and adjusts the speed slider. <br>
&nbsp; 2. **System**: gets the request and performs the adequate action. <br>
&nbsp; 3. **Admin**: watches Grace move through **GraceVision**. <br>

* **Alternative Flows and Exceptions**: <br>
&nbsp; 1. **Admin**: toggles **GraceVision** OFF. <br>
&nbsp; 2. **System**: gets the request and stops transmitting **GraceVision**. <br>
&nbsp; 3. **Admin**: moves the joystick in the intended direction and adjusts the speed slider. <br>
&nbsp; 4. **System**: gets the request and performs the adequate action. <br>
&nbsp; 5. **Admin**: observes Grace's behavior directly in person. <br>

&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; If Grace stops receiving commands after a specific interval of time, it stops moving to avoid colliding. If **GraceVision** is turned ON and for an unexpected reason it stops working, the same behavior occurs.

### User stories
This section will contain the requirements of the product described as **user stories**, organized in a global **[user story map](https://plan.io/blog/user-story-mapping/)** with **user roles** or **themes**.

[comment]: <> (For each theme, or role, you may add a small description. User stories should be detailed in the tool you decided to use for project management 'e.g. trello or github projects'.)

[comment]: <> (A user story is a description of desired functionality told from the perspective of the user or customer. A starting template for the description of a user story is:) 

[comment]: <> (*As a < user role >, I want < goal > so that < reason >.*)

[comment]: <> (**INVEST in good user stories**.
You may add more details after, but the shorter and complete, the better. In order to decide if the user story is good, please follow the [INVEST guidelines]'https://xp123.com/articles/invest-in-good-stories-and-smart-tasks/'.)

[comment]: <> (**User interface mockups**.
After the user story text, you should add a draft of the corresponding user interfaces, a simple mockup or draft, if applicable.)

[comment]: <> (**Acceptance tests**.
For each user story you should write also the acceptance tests 'textually in Gherkin', i.e., a description of scenarios 'situations' that will help to confirm that the system satisfies the requirements addressed by the user story.)

[comment]: <> (**Value and effort**.
At the end, it is good to add a rough indication of the value of the user story to the customers 'e.g. [MoSCoW]'https://en.wikipedia.org/wiki/MoSCoW_method' method' and the team should add an estimation of the effort to implement it, for example, using t-shirt sizes 'XS, S, M, L, XL'.)

[comment]: <> (### Domain model
To better understand the context of the software system, it is very useful to have a simple UML class diagram with all the key concepts 'names, attributes' and relationships involved of the problem domain addressed by your module.)

There two main user roles: the **conference participant** and the **administrator**. The former summons Grace and the latter controls it.

> 1. As an administrator, I should be able to make the robot move.

&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; Given that I'm controlling the robot <br>
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; When I press a keyboard key <br>
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; Then the robot will act accordingly.

&nbsp; **Value Category:** Must Have <br>
&nbsp; **Effort:** M

[comment]: <> (> 2. As an administrator, I should be able to change the robot's speed.
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; Given that I'm controlling the robot <br>
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; When I change the slider position <br>
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; Then the robot will change its speed accordingly.
&nbsp; **Value Category:** Must Have <br>
&nbsp; **Effort:** L)

[comment]: <> (> 3. As an administrator, I should be able to see the robot's route.
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; Given that I'm using the app <br>
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; When I'm controlling the robot <br>
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; Then I should see where the robot is heading.
&nbsp; **Value Category:** Must Have <br>
&nbsp; **Effort:** XL)

[comment]: <> (> 4. As an admnistrator, I should be able to interact with the "welcome app page".
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; Given that I open the app <br>
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; When I push the "next" button <br>
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; Then I expect the app to open a new page with the controller
&nbsp; **Value Category:** Could Have <br>
&nbsp; **Effort:** M)

[comment]: <> (> 5. As an administrator, I should be able to make the robot stop.
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; Given that the robot is moving <br>
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; When I'm not pressing any key <br>
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; Then the robot should stop moving
&nbsp; **Value Category:** Must Have <br>
&nbsp; **Effort:** M)

[comment]: <> (> 6. As an administrator, I should be able to control the robot's movement with the app's built-in joystick.
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; Given that I'm controlling the robot <br>
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; When I manipulate the joystick <br>
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; Then the robot will act accordingly
&nbsp; **Value Category:** Must Have <br>
&nbsp; **Effort:** XL)

[comment]: <> (> 7. As a user, I should be able to perform a security handshake with the robot.
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; Given that the robot is near me <br>
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; When I scan its QR code <br>
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; Then the robot should greet me
&nbsp; **Value Category:** Could Have <br>
&nbsp; **Effort:** M)

[comment]: <> (> 8. As a user, I should be able to call the robot.
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; Given that I'm using the conference app <br>
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; When I push the "call" button <br>
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; Then the robot should come to me
&nbsp; **Value Category:** Could Have <br>
&nbsp; **Effort:** M)

[comment]: <> (> 9. As an administrator, I should be able to change the robot mode to automatic.
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; Given that I'm controlling the robot <br>
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; When I push the "automatic" button <br>
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; Then the robot enters standby mode
&nbsp; **Value Category:** Could Have <br>
&nbsp; **Effort:** M)

---

## Architecture and Design
The architecture of a software system encompasses the set of key decisions about its overall organization.

* **Robot:** Uses **mechanical parts** controlled by an **Arduino** that is connected to a **Raspberry Pi** through **USB**.

* **Raspberry Pi:** Runs **Robot Operative System (ROS)** on **Ubuntu** that interprets commands received through **Web Sockets** and sends it to the Robot. 

* **Mobile App:** This the frontend component of the system, used by the user/admin to communicate with Grace through **Web Sockets**.

[comment]: <> (A well written architecture document is brief but reduces the amount of time it takes new programmers to a project to understand the code to feel able to make modifications and enhancements.)

[comment]: <> (To document the architecture requires describing the decomposition of the system in their parts 'high-level components' and the key behaviors and collaborations between them.)

[comment]: <> (In this section you should start by briefly describing the overall components of the project and their interrelations. You should also describe how you solved typical problems you may have encountered, pointing to well-known architectural and design patterns, if applicable.)

### Logical Architecture
[comment]: <> (The purpose of this subsection is to document the high-level logical structure of the code, using a UML diagram with logical packages, without the worry of allocating to components, processes or machines.)

[comment]: <> (It can be beneficial to present the system both in a horizontal or vertical decomposition: horizontal decomposition may define layers and implementation concepts, such as the user interface, business logic and concepts; vertical decomposition can define a hierarchy of subsystems that cover all layers of implementation.)

The mobile application will allow the user/admin to control the Robot's moves (via joystick). Depending on the indicated move, the app will send a different message to the "publisher node" (explained next) and therefore to the Robot, through a **Web Socket**.
On the **Robot Operative System (ROS) Melodic** side of the project, two nodes are communicating under the *Publisher-Subscriber* protocol. One of them (*publisher*) will be receiving data from a **Web Socket**, translating them into a `geometry_msgs/Twist` type of message and publishing them to the `cmd_vel` topic. The other node (*subscriber*) will be using the received data to give instructions to the Robot's motor.

![Publisher-Subscriber Diagram][pub_sub diagram]

### Physical Architecture
[comment]: <> (The goal of this subsection is to document the high-level physical structure of the software system 'machines, connections, software components installed, and their dependencies' using UML deployment diagrams or component diagrams 'separate or integrated', showing the physical structure of the system.)

[comment]: <> (It should describe also the technologies considered and justify the selections made. Examples of technologies relevant for openCX are, for example, frameworks for mobile applications 'Flutter vs ReactNative vs ...', languages to program with microbit, and communication with things 'beacons, sensors, etc.'.)

For Grace to move, there are several **mechanical parts** powered by two motors and batteries. These parts are controlled by an **Arduino** that is connected to a **Raspberry Pi 4** through **USB**. The RPI is running **Robot Operative System (ROS) Melodic** on **Ubuntu 18.04.03 LTS** and contains a ROS package to interpret commands received through **Web Sockets** and another to control the motion of the Robot. Such instructions are input from a **mobile app** used by the user/admin, which was built with **Flutter**, an open-source UI software development kit that builds natively compiled applications from a single codebase.

![UML Deplyment Diagram][uml deployment diagram]

### Prototype
[comment]: <> (To help on validating all the architectural, design and technological decisions made, we usually implement a vertical prototype, a thin vertical slice of the system.)

[comment]: <> (In this subsection please describe in more detail which, and how, users' story'ies' were implemented.)

In [User Story #1](#User-stories), a ROS node was implemented to translate keyboard inputs into messages that can be read by a second node in charge of instructing the Robot's motor movements.

---

## Implementation

* **To Do**

[comment]: <> (Regular product increments are a good practice of product management. While not necessary, sometimes it might be useful to explain a few aspects of the code that have the greatest potential to confuse software engineers about how it works. Since the code should speak by itself, try to keep this section as short and simple as possible. Use cross-links to the code repository and only embed real fragments of code when strictly needed, since they tend to become outdated very soon.)

---

## Test

* **To Do**

[comment]: <> (There are several ways of documenting testing activities, and quality assurance in general, being the most common: a strategy, a plan, test case specifications, and test checklists.)

[comment]: <> (In this section it is only expected to include the following:
 test plan describing the list of features to be tested and the testing methods and tools;
 test case specifications to verify the functionalities, using unit tests and acceptance tests.)
 
[comment]: <> (A good practice is to simplify this, avoiding repetitions, and automating the testing actions as much as possible.)

---

## Configuration and Change Management

* **To Do**

[comment]: <> (Configuration and change management are key activities to control change to, and maintain the integrity of, a project’s artifacts 'code, models, documents'.)

[comment]: <> (For the purpose of ESOF, we will use a very simple approach, just to manage feature requests, bug fixes, and improvements, using GitHub issues and following the [GitHub flow]'https://guides.github.com/introduction/flow/'.)

---

## Project Management

Software project management is an art and science of planning and leading software projects, in which software projects are planned, implemented, monitored and controlled.

[comment]: <> (In the context of ESOF, we expect that each team adopts a project management tool capable of registering tasks, assign tasks to people, add estimations to tasks, monitor tasks progress, and therefore being able to track their projects.)

[comment]: <> (Example of tools to do this are:
   [Trello.com]'https://trello.com'
   [Github Projects]'https://github.com/features/project-management/com'
   [Pivotal Tracker]'https://www.pivotaltracker.com'
   [Jira]'https://www.atlassian.com/software/jira')

[comment]: <> (We recommend to use the simplest tool that can possibly work for the team.)

For this we used [Trello.com](https://trello.com), a simple project management tool capable of registering tasks, assign tasks to people, add estimations to tasks, monitor tasks progress, and therefore being able to track our project.

The following image shows our project's progress at a given time point:

![Trello][trello]

[comment]: <> ( -------- IMAGES -------- )
[use case diagram]: ./res/use_case_diagram.png "Use Case Diagram"
[trello]: ./res/trello.jpeg "Trello"
[uml deployment diagram]: ./res/uml_deployment_diagram.jpeg "UML Deployment Diagram"
[pub_sub diagram]: ./res/pub_sub.jpg "Publisher-subscriber Diagram"
