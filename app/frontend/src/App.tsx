import React from 'react';
import { LineChart, Line, XAxis, YAxis, CartesianGrid, Tooltip, Legend, ResponsiveContainer, Brush } from 'recharts';

interface DataPoint {
  scene: number;
  emotional_value: number;
}

interface Props {
  data: DataPoint[];
}

const App = ({ data }: Props) => {
  return (
    <div>
      <ResponsiveContainer width="100%" height={300}>
        <LineChart data={data}>
          <XAxis dataKey="scene" />
          <YAxis />
          <CartesianGrid stroke="#eee" strokeDasharray="5 5" />
          <Line type="monotone" dataKey="emotional_value" name="感情値" stroke="#8884d8" />
          <Tooltip label="感情値：{value}" />
          <Legend />
          <Brush dataKey="scene" />
        </LineChart>
      </ResponsiveContainer>
    </div>
  );
};

export default App;
