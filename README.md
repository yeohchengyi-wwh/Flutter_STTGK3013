# Laundry Load Planner

Laundry Load Planner is a simple flutter application that helps users calculate the estimated washing load details including the total number of loads, water usage and total washing time. The app computes the results automatically based on user inputs such as the number of clothes, machine capacity and selected wash cycle type. It provides a clean, user-friendly interface with input validation, organized output display and a smooth user experience supported by essential Flutter widgets.

Input

•	Number of Clothes is a text field that can be entered by user to represent the total number of clothes that need to be washed

•	Machine Capacity (clothes/load) is a text field that can be entered by user to show how many clothes can be washed per load in the machine.

•	Wash Cycle Type is selected by forming a drop-down menu which conduct Quick, Normal and Heavy wash type. Each cycle type has a predefined water usage per load (L) and time duration (minutes) stored in a Map for automatic reference.

Process

•	Validate user inputs by ensuring the number of clothes and machine capacity fields are not empty and contain numeric values.

•	Show inline error message under the Text Field if invalid 

•	Formula to calculate total of estimated fuel cost:
    Total of Loads=  (Number of Clothes)/(Machine Capacity)   

    Total Water Used=Total of Loads x Water per Load

    Total Time Needed=Total of Loads x Time per Load
 
Output

•	Outputs displayed clearly within a boarded and styled Container

•	Output section include Total Water Used, Total Time Needed, Total of Loads and Wash Cycle Type

•	Button option to reset all fields including output section to start a new calculation  

Widget List Used

•	Text
•	Text Field
•	Dropdown
•	Elevated Button
•	Row
•	Column
•	Container
•	Expanded
•	Sized Box
•	Center 
•	Padding
•	Scaffold
•	AppBar
•	SnackBar

Basic Validation Approach

•	The application will check all the input Text Fields are empty or not before performing the calculations

•	double.tryParse() is used to safely convert user input from text to numbers. If the input in string format, it will return null instead of crashing the app

•	The application system will show an inline error message below the corresponding Text Fields when an invalid or empty input/null value is detected and also display a SnackBar with text (“Please insert all the current fields correctly.”)

•	This will ensure that only valid numeric values are used in the formula:

				Total of Loads=  (Number of Clothes)/(Machine Capacity)   

        Total Water Used=Total of Loads x Water per Load

        Total Time Needed=Total of Loads x Time per Load


•	After the validation process passes, the application will update the User Interface with the calculated output using setState()

<table>
  <tr>
    <td align="center">
      <img src="https://github.com/yeohchengyi-wwh/Image_Project/blob/main/SplashScreen_Laundry.png" alt="SplashPage" width="250"/>
      <br>
      <b>SplashScreen</b>
    </td>
    <td align="center">
      <img src="https://github.com/yeohchengyi-wwh/Image_Project/blob/main/HomePage_Laundry.png" alt="HomePage Before" width="250"/>
      <br>
      <b>Home Before</b>
    </td>
    <td align="center">
      <img src="https://github.com/yeohchengyi-wwh/Image_Project/blob/main/HomePage_LaundryCalculations.png" alt="HomePageAfterCalculation" width="250"/>
      <br>
      <b>Home After Calculation</b>
    </td>
  </tr>
</table>
