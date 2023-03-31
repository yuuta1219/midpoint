import React from 'react';
import { ResponsiveContainer, LineChart, Line, XAxis, YAxis, CartesianGrid, Tooltip, Legend } from 'recharts';

interface DataPoint {
  scene: number;
  name: string;
}

interface Props {
  data: DataPoint[];
}

const randomColor = () => `rgb(${Math.floor(Math.random() * 156) + 100},${Math.floor(Math.random() * 156) + 100},${Math.floor(Math.random() * 156) + 100})`;

const Card = ({ data }: Props) => {
  const uniqueNames = [...new Set(data.map((d) => d.name))];
  const nameToId = new Map(uniqueNames.map((name, index) => [name, index + 1]));
  const colors = uniqueNames.map(randomColor);

  const xAxisTicks = Array.from({ length: 40 }, (_, i) => i + 1);

  return (
    <div className='-ml-8'>
      <ResponsiveContainer width="100%" height={300}>
        <LineChart
          data={data.map((d) => ({ ...d, nameId: nameToId.get(d.name) }))}
          style={{ backgroundColor: 'transparent' }}
        >
          <CartesianGrid strokeDasharray="5 5" />
          <XAxis type="number" dataKey="scene" ticks={xAxisTicks} />
          <YAxis type="number" />
          <Tooltip
            content={({ active, payload }) => {
              if (active && payload && payload.length) {
                const { scene, nameId } = payload[0].payload;
                const foreshadowingName = data.find((d) => nameToId.get(d.name) === nameId)?.name;
                return `Scene: ${scene}, ${foreshadowingName}`;
              }
              return null;
            }}
          />
          <Legend />
          {uniqueNames.map((name, index) => {
            const dataSubset = data.filter((d) => d.name === name);
            return (
              <Line
                key={name}
                type="linear"
                dataKey="nameId"
                name={name}
                stroke={colors[index]}
                strokeWidth={5}
                isAnimationActive={false}
                dot
                legendType="line"
                data={dataSubset.map((d) => ({ ...d, nameId: nameToId.get(d.name) }))}
              />
            );
          })}
        </LineChart>
      </ResponsiveContainer>
    </div>
  );
};

export default Card;
