const tableDiv = $('#table');
const SelectFilter = $('#SelectFilter');

const GetAllEmployees = () => {
    return $.ajax({
      url: "/api/employee",
      method: "GET",
    });
};

const GetAllRoles = () => {
    return $.ajax({
      url: "/api/role",
      method: "GET",
    });
};

const USDformatter = new Intl.NumberFormat('en-US', {
    style: 'currency',
    currency: 'USD',
});

// Displays all employees in table
const DisplayEmployees = (employees) => {
    tableDiv.empty();
    let EmployeeList = new Array();

    EmployeeList.push(`
        <tr>
            <th>id</th>
            <th>Name</th>
        </tr>`
    )

    const CreateList = (id, name) => {
      const item = `
        <tr value='${id}'>
            <td>${id}</td>
            <td>${name}</td>
        </tr>`
      return item;
    };

    employees.forEach((employee) => {
      const employeeItem = CreateList(employee.id, employee.name);
      EmployeeList.push(employeeItem);
    });

    let table = $('<table>');
    table.append(EmployeeList);
    tableDiv.append(table);
};

const FilterAllEmployees = () => {
  SelectFilter.empty();
  return GetAllEmployees().then(DisplayEmployees);
};

$(document).ready(function() {
  FilterAllEmployees();
});

  