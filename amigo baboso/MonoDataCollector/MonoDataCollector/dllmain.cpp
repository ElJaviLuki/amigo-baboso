// dllmain.cpp : Defines the entry point for the DLL application.
#include "stdafx.h"



BOOL APIENTRY DllMain( HMODULE hModule,
                       DWORD  ul_reason_for_call,
                       LPVOID lpReserved
					 )
{
	OutputDebugStringA("MDC: DllMain");
	switch (ul_reason_for_call)
	{
	case DLL_PROCESS_ATTACH:
		//OutputDebugStringA("DllMain entry");
		g_hInstance=hModule;
		DataCollectorThread=CreateThread(NULL, 0, DataCollectorEntry, NULL, 0, NULL);
		SuicideThread=0;//CreateThread(NULL, 0, SuicideCheck, NULL, 0, NULL);
		break;

	case DLL_THREAD_ATTACH:
	case DLL_THREAD_DETACH:
	case DLL_PROCESS_DETACH:
		break;
	}
	return TRUE;
}

