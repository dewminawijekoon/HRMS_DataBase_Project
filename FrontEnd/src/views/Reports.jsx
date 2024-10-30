import React, { useEffect, useState } from 'react';
import { Row, Col, Card, DropdownButton, Dropdown, Spinner } from 'react-bootstrap';
import PieChart from '../components/PieChart';

function Reports() {
  const [data, setData] = useState({
    labels: [],
    datasets: [
      {
        label: 'Percentage by Role',
        data: [],
        backgroundColor: [
          'rgba(255, 99, 132, 0.2)',
          'rgba(54, 162, 235, 0.2)',
          'rgba(255, 206, 86, 0.2)',
          'rgba(75, 192, 192, 0.2)',
          'rgba(153, 102, 255, 0.2)',
          'rgba(255, 159, 64, 0.2)'
        ],
        borderColor: [
          'rgba(255, 99, 132, 1)',
          'rgba(54, 162, 235, 1)',
          'rgba(255, 206, 86, 1)',
          'rgba(75, 192, 192, 1)',
          'rgba(153, 102, 255, 1)',
          'rgba(255, 159, 64, 1)'
        ],
        borderWidth: 1
      }
    ]
  });

  const [selectedItem, setSelectedItem] = useState('Employees by Department');
  const [isSubmitting, setIsSubmitting] = useState(false);

  useEffect(() => {
    // Trigger data fetching when selectedItem changes
    if (selectedItem === 'Roles') {
      fetchData('http://localhost:8000/pie_graph_role');

    } else if (selectedItem === 'Employees by gender') {
      fetchData('http://localhost:8000/pie_graph_gender');

    } else if (selectedItem === 'Employees by Department') {
      fetchData('http://localhost:8000/pie_graph_department');
  
    } else if (selectedItem === 'Employees by Pay Grade') {
      fetchData('http://localhost:8000/pie_graph_paygrade');

    }else if(selectedItem === 'Leaves given within last month'){
      fetchData('http://localhost:8000/last_month_employee');
    }
  }, [selectedItem]);
  function formatDataForChart(rawData) {
    if (!Array.isArray(rawData) || rawData.length === 0) {
      console.warn("Raw data is empty or not an array:", rawData);
      return data; // Return existing data if rawData is empty or invalid
    }
  
    return {
      labels: rawData.map(
        item => item.department_name || item.role || item.gender || item.leave_start_date
      ),
      datasets: [
        {
          label: 'Percentage by Role',
          data: rawData.map(
            item =>
              (item.presentage_by_department ||
                item.presentage_by_role ||
                item.presentage_by_gender ||
                item.presentage_by_date_of_leave_request
              ) * 100
          ),
          backgroundColor: [
            'rgba(255, 99, 132, 0.2)',
            'rgba(54, 162, 235, 0.2)',
            'rgba(255, 206, 86, 0.2)',
            'rgba(75, 192, 192, 0.2)',
            'rgba(153, 102, 255, 0.2)',
            'rgba(255, 159, 64, 0.2)',
          ],
          borderColor: [
            'rgba(255, 99, 132, 1)',
            'rgba(54, 162, 235, 1)',
            'rgba(255, 206, 86, 1)',
            'rgba(75, 192, 192, 1)',
            'rgba(153, 102, 255, 1)',
            'rgba(255, 159, 64, 1)',
          ],
          borderWidth: 1,
        },
      ],
    };
  }
  
  const fetchData = async (url) => {
    setIsSubmitting(true);
    try {
      const response = await fetch(url, {
        method: 'GET',
        headers: {
          'Content-Type': 'application/json',
          'Authorization': `Bearer ${localStorage.getItem('token')}`
        }
      });
      if (response.ok) {
        const fetchedData = await response.json();
        console.log('Fetched Data:', fetchedData); // Debug fetched data
        setData(formatDataForChart(fetchedData));
        console.log("used data",data.labels);
        console.log(data.datasets[0].data);     
      } else {
        console.error('Fetch failed:', response.status);
      }
    } catch (error) {
      console.error('Error occurred:', error);
    } finally {
      setIsSubmitting(false);
    }
  };

  const handleSelect = (eventKey) => {
    setSelectedItem(eventKey);
  };

  return (
    <React.Fragment>
      <Card>
        <Card.Body>
          <Row>
            <Col>
              <Dropdown.Header>Select Report Type</Dropdown.Header>
            </Col>
            <Col>
              <DropdownButton
                title={selectedItem}
                onSelect={handleSelect}
                variant="success"
                id="dropdown-basic"
              >
                <Dropdown.Item eventKey="Employees by Department">Employees by Department</Dropdown.Item>
                <Dropdown.Item eventKey="Roles">Roles</Dropdown.Item>
                <Dropdown.Item eventKey="Leaves given within last month">Leaves given within last month</Dropdown.Item>
                <Dropdown.Item eventKey="Employees by gender">Employees by gender</Dropdown.Item>
              </DropdownButton>
            </Col>
          </Row>
        </Card.Body>
      </Card>

      <Row className="d-flex justify-content-around">
        <Card className="deptChart">
          <Card.Header>{selectedItem}</Card.Header>
          <Card.Body className="d-flex justify-content-center align-items-center">
            {isSubmitting ? (
              <Spinner animation="border" role="status">
                <span className="sr-only">Loading...</span>
              </Spinner>
            ) : (
              <Col md={8} lg={8} xl={6} xxl={6}>
                <PieChart data={data} />
              </Col>
            )}
          </Card.Body>
        </Card>
      </Row>
    </React.Fragment>
  );
}

export default Reports;