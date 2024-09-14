# Expense Tracker App

<p>An Expense Tracker app built with Flutter that helps users track their expenses by adding, categorizing, and viewing expenses in a clean and organized way. The app supports dark mode and has a responsive design, making it accessible across devices of different screen sizes.</p>

## Features

<ul>
<li><strong>Add New Expenses:</strong> Users can add expenses with a title, amount, date, and category.</li>
<li><strong>Category Dropdown:</strong> Select expense categories like Leisure, Work, etc.</li>
<li><strong>Date Picker:</strong> Choose a date for the expense with a built-in date picker.</li>
<li><strong>Expense List:</strong> View the list of all added expenses.</li>
<li><strong>Delete & Undo:</strong> Delete expenses with the option to undo the action.</li>
<li><strong>Chart Display:</strong> Visual representation of expenses via a bar chart.</li>
<li><strong>Responsive Design:</strong> Optimized for both small (mobile) and large (tablet/desktop) screens.</li>
<li><strong>Dark Mode Support:</strong> Automatically adjusts to dark mode based on system preferences.</li>
<li><strong>Error Handling:</strong> Alerts for invalid input when adding new expenses.</li>
</ul>

## Installation

### Prerequisites

<p>Before you begin, ensure you have met the following requirements:</p>

<ul>
<li><Strong>Flutter SDK: </Strong> Install the latest version of Flutter.</li>
<li><Strong>Dart SDK: </Strong> Comes pre-installed with Flutter.</li>
<li><Strong>IDE: </Strong> Any IDE with Flutter support, such as Visual Studio Code or Android Studio.</li>
</ul>

### Setup

<ol>
<li><Strong>Clone the repository:</Strong></li>
<p>git clone https://github.com/mumerkhan786/expense_tracker.git</p>
<li><Strong>Navigate into the project directory:</Strong></li>
<p>cd expense_tracker</p>
<li><Strong>Install the dependencies:</Strong></li>
<p>flutter pub get</p>
<li><Strong>Run the app on an emulator or a physical device:</Strong></li>
<p>flutter run</p>
</ol>

## Usage

<ol>
<li><strong>Adding an Expense:</strong>
<ul>
<li>Tap the <b>Add</b> button in the app bar to open the expense input form.</li>
<li>Fill in the expense details, including title, amount, date, and category.</li>
<li>Tap <b>Save</b> to add the expense.</li>
</ul>
</li>
<li><strong>Viewing Expenses:</strong>
<ul>
<li>Once added, expenses appear in the list.</li>
<li>The expenses are categorized and displayed in the chart above the list.</li>
</ul>
</li>
<li><strong>Deleting an Expense:</strong>
<ul>
<li>Swipe an expense item to delete it.</li>
<li>An <b>Undo</b> button appears in a snack bar to revert the deletion if needed.</li>
</ul>
</li>
<li><strong>Viewing Data in Charts:</strong>
<ul>
<li>The bar chart shows the total expenses for each category. This helps you visualize where most of your money is spent.</li>
</ul>
</li>
</ol>

## Project Structure

<ul>
  <li>lib/
    <ul>
      <li>main.dart - Entry point of the app</li>
      <li>model/
        <ul>
          <li>expense_structure.dart - Defines the expense model and categories</li>
        </ul>
      </li>
      <li>widget/
        <ul>
          <li>chart_bar/
            <ul>
              <li>chart.dart - Bar chart for visualizing expenses</li>
              <li>chart_bar.dart - Handles the data and logic for the chart</li>
            </ul>
          </li>
          <li>expenses_list/
            <ul>
              <li>expense_list.dart - Expense list widget</li>
            </ul>
          </li>
          <li>inputs/
            <ul>
              <li>amount_row.dart - Row for inputting amount in the form</li>
              <li>category_dropdown.dart - Dropdown for selecting expense category</li>
              <li>date_row.dart - Row for selecting date in the form</li>
              <li>text_field_widget.dart - Reusable text input widget</li>
            </ul>
          </li>
          <li>actions/
            <ul>
              <li>action_buttons.dart - Save/Cancel action buttons</li>
            </ul>
          </li>
          <li>expenses.dart - Main widget containing the expense tracker screen</li>
          <li>new_expenses.dart - Widget for adding new expenses</li>
        </ul>
      </li>
      <li>README.md - Documentation of the project</li>
    </ul>
  </li>
</ul>

## Dependencies

<p>This project uses the following Flutter dependencies:</p>

<ul>
<li><strong>flutter:</strong> Flutter SDK</li>
<li><strong>intl:</strong> To format dates</li>
<li><strong>provider:</strong> Optional for state management, not currently used</li>
</ul>

<p><strong>To install any of the dependencies, run:</strong></p>

<p>flutter pub get</p>

## Contributing

<p>Contributions are welcome! If you have any ideas, suggestions, or improvements, feel free to submit a pull request. Please ensure that your changes are consistent with the project's overall structure and code quality.</p>

