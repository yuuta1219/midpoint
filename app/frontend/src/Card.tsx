import React from 'react';
import { ResponsiveContainer, LineChart, Line, XAxis, YAxis, CartesianGrid, Tooltip, Legend } from 'recharts';

interface DataPoint {
  scene: number;
  foreshadowing_id: number;
  name: string;
}

interface Props {
  data: DataPoint[];
}

const randomColor = () => `rgb(${Math.floor(Math.random() * 156) + 100},${Math.floor(Math.random() * 156) + 100},${Math.floor(Math.random() * 156) + 100})`;

const Card  = ({ data }: Props) => {
  const uniqueIds = [...new Set(data.map((d) => d.foreshadowing_id))];
  const colors = uniqueIds.map(randomColor);

  return (
    <ResponsiveContainer width="100%" height={300}>
      <LineChart
        data={data}
        style={{ backgroundColor: 'transparent' }}
      >
        <CartesianGrid strokeDasharray="5 5" />
        <XAxis type="number" dataKey="scene" />
        <YAxis type="number" />
        <Tooltip
          content={({ active, payload }) => {
            if (active && payload && payload.length) {
              const { scene, foreshadowing_id } = payload[0].payload;
              const foreshadowingName = data.find((d) => d.foreshadowing_id === foreshadowing_id)?.name;
              return `Scene: ${scene}, ${foreshadowingName}`;
            }
            return null;
          }}
        />
        <Legend />
        {uniqueIds.map((id, index) => {
          const dataSubset = data.filter((d) => d.foreshadowing_id === id);
          const name = dataSubset[0].name;
          return (
            <Line
              key={id}
              type="linear"
              dataKey="foreshadowing_id"
              name={name}
              stroke={colors[index]}
              strokeWidth={2}
              isAnimationActive={false}
              dot
              legendType="line"
              data={dataSubset}
            />
          );
        })}
      </LineChart>
    </ResponsiveContainer>
  );
};

export default Card;
