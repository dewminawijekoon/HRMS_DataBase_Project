// EmployeeChart.jsx
import React, { useEffect, useState } from 'react';
import { AgCharts } from 'ag-charts-react';

const EmployeeChart = ({ employeeData }) => {
  const [chartOptions, setChartOptions] = useState({
    title: {
      text: 'Employee Distribution by Department',
    },
    data: [],
    series: [
      {
        type: 'bar', // Set chart type to 'bar' for histogram
        xKey: 'department_name', // Key for x-axis
        yKey: 'employee_count', // Key for y-axis
        label: {
          enabled: true, // Enable labels on bars
        },
      },
    ],
    axes: [
      {
        type: 'category',
        position: 'bottom',
        title: 'Department',
      },
      {
        type: 'number',
        position: 'left',
        title: 'Number of Employees',
      },
    ],
  });

  useEffect(() => {
    const departmentCount = {};

    // Count employees per department
    employeeData.forEach(employee => {
      const department = employee.department_name;
      departmentCount[department] = (departmentCount[department] || 0) + 1;
    });

    // Transform the data for the chart
    const chartData = Object.keys(departmentCount).map(department => ({
      department_name: department,
      employee_count: departmentCount[department],
    }));

    setChartOptions(prevOptions => ({
      ...prevOptions,
      data: chartData,
    }));
  }, [employeeData]);

  return (
    <div style={{ height: '400px', width: '100%' }}>
      <AgCharts options={chartOptions} />
    </div>
  );
};

export default EmployeeChart;
