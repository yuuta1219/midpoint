import React from 'react';
import { ResponsiveContainer, LineChart, Line, XAxis, YAxis, CartesianGrid, Tooltip, Legend } from 'recharts';


const randomColor = () => `rgb(${Math.floor(Math.random() * 156) + 100},${Math.floor(Math.random() * 156) + 100},${Math.floor(Math.random() * 156) + 100})`;

const Card  ({ date }) => {
  const uniqueIds = [...new Set(data.map((d) => d.id))];
  const colors = uniqueIds.map(randomColor);

  return (
    <ResponsiveContainer width="100%" height={300}>
      <LineChart
        data={data}
        margin={{
          top: 5,
          right: 30,
          left: 20,
          bottom: 5,
        }}
        style={{ backgroundColor: 'transparent' }} // 背景を透過するためにstyleプロパティを追加する
      >
        <CartesianGrid strokeDasharray="5 5" />
        <XAxis type="number" dataKey="scene" />
        <YAxis type="number"/>
        <Tooltip
          content={({ active, payload }) => {
            if (active && payload && payload.length) {
              const { scene, id } = payload[0].payload;
              return `Scene: ${scene}, ID: ${id}`;
            }
            return null;
          }}
        />
        <Legend />
        {uniqueIds.map((id, index) => (
          <Line
            key={id}
            type="linear"
            dataKey="id"
            stroke={colors[index]}
            strokeWidth={2}
            isAnimationActive={false}
            dot={false}
            legendType="line"
            data={data.filter((d) => d.id === id)}
          />
        ))}
      </LineChart>
    </ResponsiveContainer>
  );
};

export default Card;

