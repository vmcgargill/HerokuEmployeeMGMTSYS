const tableDiv = $('#table');

const GetAllDepartments = () => {
    return $.ajax({
      url: "/api/department",
      method: "GET",
    });
};

const GetDepartmentBudget = (id) => {
  return $.ajax({
    url: `/api/UBDepartment/${id}`,
    method: "GET",
  });
};

const DisplayDepartments = (departments) => {
    let DepartmentList = new Array();

    DepartmentList.push(`
        <tr>
            <th>ID</th>
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

    departments.forEach((department) => {
      const departmentItem = CreateList(department.id, department.name);
      DepartmentList.push(departmentItem);
    });

    let table = $('<table>');
    table.append(DepartmentList);
    tableDiv.append(table);
  };

const USDformatter = new Intl.NumberFormat('en-US', {
  style: 'currency',
  currency: 'USD',
});


const GetDepartments = () => {
    return GetAllDepartments().then(DisplayDepartments);
};

GetDepartments()