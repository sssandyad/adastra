﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Adastra
{
    public class EmotivFeatureGenerator : IFeatureGenerator
    {
        EmotivRawDataReader er;
        IDigitalSignalProcessor processor;

        public EmotivFeatureGenerator()
        {
        }

        public EmotivFeatureGenerator(IDigitalSignalProcessor processor)
        {
            this.processor = processor;
        }

        public void Update()
        {
            //Read RAW data

            if (er == null)
            {
                er = new EmotivRawDataReader();
                er.Values += new RawDataChangedEventHandler(er_Values);
            }

            er.Update();
        }

        void er_Values(double[] rawData)
        {
            //Filter signal
            if (processor != null)
                processor.DoWork(ref rawData);

            //Generate feature vectors
            double[] featureVectors = rawData;

            //send feature vectors
            if (Values != null)
                Values(featureVectors);
        }

        public event ChangedEventHandler Values;

    }
}