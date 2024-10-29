import React, { useRef } from 'react';
import { Pie } from 'react-chartjs-2';
import { Chart as ChartJS, ArcElement, Tooltip, Legend } from 'chart.js';
import jsPDF from 'jspdf';
import html2canvas from 'html2canvas';
import { Button } from 'react-bootstrap';

ChartJS.register(ArcElement, Tooltip, Legend);

const PieChart = ({ data }) => {
  const chartRef = useRef();

  const exportPDF = () => {
    const input = chartRef.current; 
    html2canvas(input).then((canvas) => {
      const imgData = canvas.toDataURL('image/png');
      const pdf = new jsPDF();
      pdf.addImage(imgData, 'PNG', 10, 10, 180, 160);
      pdf.save('chart.pdf'); 
    });
  };

  const options = {
    responsive: true, 
    plugins: {
      legend: {
        position: 'right', 
        align: 'center', 
        labels: {
          boxWidth: 40, 
          padding: 70, 
        },
      },
    },
  };


  return (
    <div>
      <div ref={chartRef}>
        <Pie data={data} options={options}/>
      </div>
      <br />
      <Button onClick={exportPDF} className="mt-3">
        Download Report
      </Button>
    </div>
  );
};

export default PieChart;
