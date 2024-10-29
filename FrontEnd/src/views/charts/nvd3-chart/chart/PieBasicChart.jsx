import React, { useEffect } from 'react';
import * as d3 from 'd3';


const PieBasicChart = ({ chartId, datum }) => {
  useEffect(() => {
    // Clear any previous SVG content inside the chart container
    d3.select(`#${chartId}`).selectAll('svg').remove();

    const width = 300;
    const height = 300;
    const radius = Math.min(width, height) / 2;

    const svg = d3
      .select(`#${chartId}`)
      .append('svg')
      .attr('width', width)
      .attr('height', height)
      .append('g')
      .attr('transform', `translate(${width / 2},${height / 2})`);

    const colorScale = d3.scaleOrdinal().range(['#ff8a65', '#f4c22b', '#04a9f5', '#3ebfea', '#4F5467', '#1de9b6', '#a389d4', '#FE8A7D']);

    const pie = d3.pie().value((d) => d.y);

    const path = d3.arc().outerRadius(radius).innerRadius(0);

    const arcs = svg.selectAll('arc').data(pie(datum)).enter().append('g');

    arcs
      .append('path')
      .attr('d', path)
      .attr('fill', (d) => colorScale(d.data.color))
      .attr('stroke', 'white')
      .style('stroke-width', '2px');

    arcs
      .append('text')
      .attr('transform', (d) => `translate(${path.centroid(d)})`)
      .attr('dy', '0.35em')
      .style('text-anchor', 'middle')
      .text((d) => d.data.key);

  }, [chartId]);

  return <div id={chartId}></div>;
};

export default PieBasicChart;
