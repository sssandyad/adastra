﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Adastra
{
    public class OpenVibeRawDataReader : IRawDataReader
    {
        public void Update()
        {

        }

        public event RawDataChangedEventHandler Values;
    }
}
